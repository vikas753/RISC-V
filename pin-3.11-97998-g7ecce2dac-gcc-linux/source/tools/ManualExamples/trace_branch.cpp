/* Modified 9/25/85 - use MAXNUM-1 for quick, eliminate 3 statements in quick */
 

#include "pin.H" 
#include <iostream>
#include <fstream>
#include <vector>

using std::cerr;
using std::ofstream;
using std::ios;
using std::string;
using std::endl;
#define MAXNUM 2000 
#define COUNT 100
#define MODULUS ((long) 0x20000)
#define C 13849L
#define A 25173L
 

// Global variables to hold the instructions and a file pointer to write output
static UINT64 icount = 0;
static UINT64 readMemoryCount = 0;
static UINT64 writeMemoryCount = 0;
static UINT64 branchInstructionCount = 0;
static UINT64 SyscallInstructionCount = 0;
static UINT64 StackAccessInstructionCount = 0;

// Tracks the state of fibonacci recursive functions
static UINT64 fibonacciRecursiveFunctionTracker = 0;

UINT64 min_inst_ptr = 0xffffffffffffffff;
UINT64 max_inst_ptr = 0;
 
// Boundary of a 4KB page
#define FOURKBBOUNDARY 4096

ofstream OutFile;

KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE, "pintool",
    "o", "conditional_itrace.out", "specify output file name");

std::vector<UINT64> DistinctInstruction4KBpages ; 

// Push a Distinct 4KB Page onto vector or container 
void DistinctInstruction4kbPagePush(UINT64 addr)
{
  DistinctInstruction4KBpages.push_back(addr);
  int last_index = DistinctInstruction4KBpages.size()-1;
  int iter_index = last_index ; 
  
  while((iter_index !=0) && (DistinctInstruction4KBpages[iter_index] <  DistinctInstruction4KBpages[iter_index-1]))
  {
    UINT64 temp =  DistinctInstruction4KBpages[iter_index];
    DistinctInstruction4KBpages[iter_index] = DistinctInstruction4KBpages[iter_index-1];
    DistinctInstruction4KBpages[iter_index-1] = temp;
    iter_index = iter_index - 1;
  }

  if( iter_index > 0 )
  {
    if(DistinctInstruction4KBpages[iter_index] ==  DistinctInstruction4KBpages[iter_index-1]) 
    {
      DistinctInstruction4KBpages.erase(DistinctInstruction4KBpages.begin()+iter_index);
    }
    else
    {
      OutFile << " Instruction Distinct Page Added ! " << endl;
    }
  }   
} 

// Print a memory read record
VOID RecordMemRead(VOID * ip, VOID * addr)
{
    UINT64 addr_ptr = (long)addr;

    min_inst_ptr = (addr_ptr < min_inst_ptr)?addr_ptr:min_inst_ptr;
    max_inst_ptr = (addr_ptr > max_inst_ptr)?addr_ptr:max_inst_ptr;
   
    UINT64 InstructionAligned4kb = (long)addr / FOURKBBOUNDARY;
    DistinctInstruction4kbPagePush(InstructionAligned4kb);
    readMemoryCount = readMemoryCount + 1;
    OutFile << ip << " R " << addr << endl;
}

// Print a memory write record
VOID RecordMemWrite(VOID * ip, VOID * addr)
{
    UINT64 addr_ptr = (long)addr;

    min_inst_ptr = (addr_ptr < min_inst_ptr)?addr_ptr:min_inst_ptr;
    max_inst_ptr = (addr_ptr > max_inst_ptr)?addr_ptr:max_inst_ptr;
 
    UINT64 InstructionAligned4kb = addr_ptr / FOURKBBOUNDARY;
    DistinctInstruction4kbPagePush(InstructionAligned4kb);
    writeMemoryCount = writeMemoryCount + 1;
    OutFile << ip << " W " << addr << endl;
}

// record a control flow instruction
VOID RecordIsControlFlow(INS ins)
{
    OutFile << " Branch Starts ! : address :  " << INS_Address(ins) << endl ; 
    branchInstructionCount = branchInstructionCount + 1;
}

// record a control flow instruction
VOID RecordIsSysCallInstruction()
{
    SyscallInstructionCount = SyscallInstructionCount + 1;
}

VOID fibonacci_wrapper_start()
{
  fibonacciRecursiveFunctionTracker = fibonacciRecursiveFunctionTracker + 1;
  OutFile << " Fibonacci Start ! " << endl;
}

VOID fibonacci_wrapper_exit()
{
  fibonacciRecursiveFunctionTracker = fibonacciRecursiveFunctionTracker - 1;
  OutFile << " Fibonacci Exit ! " << endl;
}

#define FIBONACCI_MAIN "_Z17fibonacci_wrapperv"

VOID ImageLoad(IMG img, VOID *v)
{

    RTN fibonacciwrapperRtn = RTN_FindByName(img, FIBONACCI_MAIN);
    if (RTN_Valid(fibonacciwrapperRtn))
    {
        OutFile << " Fibonacci Hit ! " << endl;
        RTN_Open(fibonacciwrapperRtn);

        // Instrument fibnacci_wrapper() to print the start in trace.
        RTN_InsertCall(fibonacciwrapperRtn, IPOINT_BEFORE, (AFUNPTR)fibonacci_wrapper_start,
                                                     IARG_ADDRINT, FIBONACCI_MAIN,
                                                     IARG_FUNCARG_ENTRYPOINT_VALUE, 0,
                                                               IARG_END);
        RTN_InsertCall(fibonacciwrapperRtn, IPOINT_AFTER, (AFUNPTR)fibonacci_wrapper_exit, IARG_FUNCRET_EXITPOINT_VALUE, IARG_END);
        RTN_Close(fibonacciwrapperRtn);
    }
}  

// Pin calls this function every time a new img is unloaded
// You can't instrument an image that is about to be unloaded
VOID ImageUnload(IMG img, VOID *v)
{
     OutFile << "Unloading " << IMG_Name(img) << endl;
}

// record a control flow instruction
VOID RecordIsStackAccess()
{
    StackAccessInstructionCount = StackAccessInstructionCount + 1;
}

VOID RecordIsCJmp()
{
    OutFile << " Conditional Branch Starts ! " << endl;
}


// This function is called before every instruction is executed
// and prints the IP
VOID printip(VOID *ip) { OutFile << "IP : "<< ip << endl; icount++; }

VOID takenConditionalBranch() { OutFile << "Taken Conditional Branch print !" << endl; }

// Pin calls this function every time a new instruction is encountered
VOID Instruction(INS ins, VOID *v)
{

    UINT32 memOperands = INS_MemoryOperandCount(ins);
   

    if(fibonacciRecursiveFunctionTracker > 0)
    {
      INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)printip, IARG_INST_PTR, IARG_END);
	
      if(INS_IsSyscall(ins)|| (INS_IsSysret(ins)))
      {
        RecordIsSysCallInstruction();
      }

      if(INS_IsStackWrite(ins)|| (INS_IsStackRead(ins)))
      {
        RecordIsStackAccess();
      }

      if(INS_IsBranch(ins) && INS_HasFallThrough(ins))
      {
        RecordIsControlFlow(ins);
        INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)takenConditionalBranch, IARG_INST_PTR, IARG_BRANCH_TAKEN, IARG_END);
      }
      // Iterate over each memory operand of the instruction.
      for (UINT32 memOp = 0; memOp < memOperands; memOp++)
      {
          if (INS_MemoryOperandIsRead(ins, memOp))
          {
              INS_InsertPredicatedCall(
                  ins, IPOINT_BEFORE, (AFUNPTR)RecordMemRead,
                  IARG_INST_PTR,
                  IARG_MEMORYOP_EA, memOp,
                  IARG_END);
          }
          // Note that in some architectures a single memory operand can be 
          // both read and written (for instance incl (%eax) on IA-32)
          // In that case we instrument it once for read and once for write.
          if (INS_MemoryOperandIsWritten(ins, memOp))
          {
              INS_InsertPredicatedCall(
                  ins, IPOINT_BEFORE, (AFUNPTR)RecordMemWrite,
                  IARG_INST_PTR,
                  IARG_MEMORYOP_EA, memOp,
                  IARG_END);
          }
       }
    }
	
	
}

// This function is called when the application exits
VOID Fini(INT32 code, VOID *v)
{ 
    OutFile << " Syscall Instruction count = " << SyscallInstructionCount << endl; 
    OutFile << " Stack Access Instruction count = " << StackAccessInstructionCount << endl;
    OutFile << " Branch Instruction count = " << branchInstructionCount << endl;
    OutFile << " Memory write count = " << writeMemoryCount << endl;
    OutFile << " Memory read count = " << readMemoryCount << endl;
    OutFile << " Total Instruction count = " << icount << endl;
    OutFile << " Min instruction address = " << min_inst_ptr << endl;
    OutFile << " Max instruction address = " << max_inst_ptr << endl;
    OutFile << " 4kb Distinct Memory Page access count = " <<  (DistinctInstruction4KBpages.size()-1);
    OutFile << "#eof\n";
    OutFile.close();
} 
 
       long random();
       long buffer[MAXNUM] = {0};
 
/* ===================================================================== */
/* Print Help Message                                                    */
/* ===================================================================== */

INT32 Usage()
{
    cerr << "This tool counts the number of dynamic instructions executed" << endl;
    cerr << endl << KNOB_BASE::StringKnobSummary() << endl;
    return -1;
} 

// Pin calls this function every time a new rtn is executed
VOID Routine(RTN rtn, VOID *v)
{
     
  //The RTN goes away when the image is unloaded, so save it now
  //because we need it in the fini
  OutFile << " Routine name is " <<  RTN_Name(rtn) << endl;
  OutFile << " Routine Address is " << RTN_Address(rtn) << endl;
}

int main(int argc, char * argv[])
{

  // Initialize PIN module for instrumentation purpose
  if (PIN_Init(argc, argv)) return Usage();

  // OPen a file in output mode for writing purpose
  OutFile.open(KnobOutputFile.Value().c_str());

  PIN_InitSymbols();

  // Instruction function would be executed when a new instruction is 
  // executed
  INS_AddInstrumentFunction(Instruction, 0);

  // Register ImageLoad to be called when an image is loaded
  IMG_AddInstrumentFunction(ImageLoad, 0);
  
  // Register ImageUnload to be called when an image is unloaded
  IMG_AddUnloadFunction(ImageUnload, 0);

  // Register Routine to be called to instrument rtn
//  RTN_AddInstrumentFunction(Routine, 0);

  // Fini function would be executed on closing of the program
  PIN_AddFiniFunction(Fini, 0);
 

  // Never returns
  PIN_StartProgram();

 	
  exit(0);
}
 




