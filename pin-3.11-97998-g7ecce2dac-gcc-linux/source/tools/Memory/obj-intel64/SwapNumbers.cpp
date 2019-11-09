/*
 Name : VIKAS VEERABATHINI
 NU ID : 001302155
 Program : Swap by reference and pointers
 please use g++ for compilation 
*/

#include<iostream>
using namespace std;

/*Swap the values in two variables using pointers .
  An cautionary check has been added to see if pointers 
  aint NULL and if values are equal they wont be swapped to save cycles */

template <typename T>
bool SwapP(T* Var1 , T* Var2)
{
  if((Var1!=NULL) && (Var2!=NULL))
  {
    if(*Var1 != *Var2)
    {
      T TempPlaceholder = *Var2;
      *Var2 = *Var1;
      *Var1 = TempPlaceholder;
    }

    return true;
  }
  else
  {
    return false;
  }
}

/* Swap the values in two variables using pointers .
   We would be swapping the pointers to the variables
   rather than simply exchanging the values , which
   is a second need of the problem statement . 
   An cautionary check has been added to see if pointers 
   aint NULL and if values are equal they wont be swapped to save cycles */

template <typename T>
bool SwapP2(T** Var1 , T** Var2)
{
  if((*Var1!=NULL) && (*Var2!=NULL))
  {
    if(*Var1 != *Var2)
    {
      T* TempPlaceholder = *Var2;
      *Var2 = *Var1;
      *Var1 = TempPlaceholder;
    }

    return true;
  }
  else
  {
    return false;
  }
}
/*
  Swap the values of two variables by passing them using reference . 
  If they are equal , then bypass swap operation .
*/

template <typename T>
void SwapR(T& Var1 , T& Var2)
{
  if(Var1 != Var2)
  {
    T TempPlaceholder = Var2;
    Var2 = Var1;
    Var1 = TempPlaceholder;
  }
}

int main()
{
  /* A basic test case undergoes here */

  int a = 9 , b = 10;
  int *p1 = &a , *p2 = &b; 

  cout << "Without Swap : " << a << "," << b << endl;
  cout << "Before SwapP : " << *p1 << "," << *p2 << endl;

  if(SwapP<int>(p1,p2)==true)
  {
    cout << "With SwapP : " << *p1 << "," << *p2 << endl;
  }
  
  cout << " Swap addresses : " << p1 << "," << p2 << endl;   

  if(SwapP2<int>(&p1,&p2) == true)
  {
    cout << " Swap addresses P2 : " << p1 << "," << p2 << endl;
    cout << " Swap addresses values SwapP2 : " << *p1 << "," << *p2 << endl; 
  }

  SwapR(a,b);
  
  cout << "With SwapR :" << a << "," << b << endl;

  return 0;
}
