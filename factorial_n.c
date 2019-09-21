int mul(int x,int y)
{
  int multiplicand = 0;
  for(int i=0;i<y;i++)
  {
    multiplicand = multiplicand + x;
  }
  return multiplicand;
}


int factorial(int n)
{
  int factorial = 1;
  for(int i=1;i<=n;i++)
  {
    factorial = mul(factorial,i);
  }
  return factorial;
}

int main()
{
  int result = factorial(5);
  return 0;
}