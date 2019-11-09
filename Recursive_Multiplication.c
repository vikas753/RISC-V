int mul(int x,int y)
{
  if((x==0) || (y==0))
  {
    return 0;
  }
  else
  {
    return x+mul(x,y-1);
  }
}

int main()
{
  int a=10,b=20;
  int sum = mul(a,b);
  return 0;
}