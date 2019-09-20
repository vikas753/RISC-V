int mul(int x,int y)
{
  if((x==0) || (y==0))
  {
    return 0;
  }
  else
  {
    if(y%2==0)
    {
      return mul(x<<1,y>>1);
    }
    else
    {
      return x+mul(x,(y-1));
    }
  }
}

int main()
{
  int a=10,b=20;
  int sum = mul(a,b);
  return 0;
}