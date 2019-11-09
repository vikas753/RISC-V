int mul(int x,int y)
{
  int multiplicand = 0 ;
  for(int i=0;i<y;i++)
  {
    multiplicand = multiplicand + x;
  }
  return multiplicand;
}

int main()
{
  int a=10,b=20;
  int sum = mul(a,b);
  return 0;
}