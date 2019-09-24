/* Modified 9/25/85 - use MAXNUM-1 for quick, eliminate 3 statements in quick */
 

#include "pin.H" 
#include <iostream>
#include <fstream>

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

ofstream OutFile;

KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE, "pintool",
    "o", "qsort_prof.out", "specify output file name");

// Print a memory read record
VOID RecordMemRead(VOID * ip, VOID * addr)
{
    OutFile << "%p: R %p\n", ip, addr;
}

// Print a memory write record
VOID RecordMemWrite(VOID * ip, VOID * addr)
{
    OutFile << "%p: W %p\n", ip, addr;
}

// This function is called before every instruction is executed
// and prints the IP
VOID printip(VOID *ip) { OutFile << "%p\n", ip; icount++; }

// Pin calls this function every time a new instruction is encountered
VOID Instruction(INS ins, VOID *v)
{
    // Insert a call to printip before every instruction, and pass it the IP
    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)printip, IARG_INST_PTR, IARG_END);
	
	UINT32 memOperands = INS_MemoryOperandCount(ins);

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

// This function is called when the application exits
VOID Fini(INT32 code, VOID *v)
{
	OutFile << " Instruction count = 0x%x" , icount;
    OutFile << "#eof\n";
    OutFile.close();
} 
 
static long seed = 7L;
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


 
void quick(int lo,int hi,long base[])
{
  int i,j;
  long pivot,temp;
 
  if(lo<hi)
  {
    for(i=lo,j=hi,pivot=base[hi];i<j;)
	{
	  while(i<j && base[i]<=pivot)
	  ++i;
	  while(j>i && base[j]>=pivot)
	  --j;
	  if(i<j)
	  {
		temp = base[i];
		base[i]=base[j];
		base[j]=temp;
	  }
	}
	quick(lo,i-1,base);
    quick(i+1,hi,base);
  }
}
 
long random_qsort(long size)
{
  seed=seed *A+C;
  return(seed%size);
}

 
int main(int argc, char * argv[])
{

  // Initialize PIN module for instrumentation purpose
  if (PIN_Init(argc, argv)) return Usage();

  // OPen a file in output mode for writing purpose
  OutFile.open(KnobOutputFile.Value().c_str());

  // Instruction function would be executed when a new instruction is 
  // executed
  INS_AddInstrumentFunction(Instruction, 0);

  // Fini function would be executed on closing of the program
  PIN_AddFiniFunction(Fini, 0);

  // Never returns
  PIN_StartProgram();
	
  int i,j;
  long temp;
  /* printf("Filling array and sorting %d times \n",COUNT); */
  for(i=0;i<COUNT;++i)
  {
	for(j=0;j<MAXNUM;++j)
    {
	  temp=random_qsort(MODULUS);
	  if (temp<0L)
        temp=(-temp);
	  buffer[j]=temp;
    }
	/* printf("Buffer full,iteration %d\n",i); */
	quick(0,MAXNUM-1,buffer);
  }
  /* printf("done\n"); */
  exit(0);
}
 




