#include <stdio.h>
#include <stdlib.h>
  
    
void fibonacci_wrapper()
{  
  int i=20;
  
  if(i<30)
  {
    i=20;
  }
  else
  {
    i=25;
  }

  if(i>30)
  {
    i=45;
  }
  else
  {
    i=60;
  }
        
  if(i<60)
  {
    i=45;
  }
  else
  {
    i=60;
  }
  int a=0;
  for(int i=0;i<3;i++)
  {
    a++;
  }
  
}
 
int main()
{
  int i=20;
  unsigned value;
        
  fibonacci_wrapper();
  exit(0);
}

