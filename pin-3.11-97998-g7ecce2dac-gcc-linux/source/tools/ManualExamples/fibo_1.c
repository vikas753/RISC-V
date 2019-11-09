#include <stdio.h>
#include <stdlib.h>
 
#define NTIMES 1000 
#define NUMBER 24
 
int main()
        {
        int i;
        unsigned value, fib();
        
        printf("%d iterations:",NTIMES);
        fibonacci_wrapper();
        exit(0);
        }

 
unsigned fib(x)
        int x;
        {
        if(x>2)
                return(fib(x-1)+fib(x-2));
        else
        return(1);
        }  
    
void fibonacci_wrapper()
{  
  int value;
  for (int i=1;i<=NTIMES;i++)
  {  
    value=fib(NUMBER);
  }
  
  printf("fibonacci(%d)=%u.\n",NUMBER,value);     
}
  
