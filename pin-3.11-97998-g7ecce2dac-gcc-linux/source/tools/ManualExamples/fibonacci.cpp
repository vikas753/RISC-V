/*
 * Copyright 2002-2019 Intel Corporation.
 * 
 * This software is provided to you as Sample Source Code as defined in the accompanying
 * End User License Agreement for the Intel(R) Software Development Products ("Agreement")
 * section 1.L.
 * 
 * This software and the related documents are provided as is, with no express or implied
 * warranties, other than those that are expressly stated in the License.
 */

#include <iostream>
#include <sstream>
#include <cstdlib>
#include <cstring>

unsigned long Fibonacci(unsigned long);

#define NTIMES 1000

int main(int argc, char **argv)
{
    if (argc > 2)
    {
        std::cerr << "Usage: fibonacci [num]" << std::endl;
        return 1;
    }

    unsigned long num = 24 , value = 0;
    if (argc == 2)
    {
        std::istringstream is;
        is.str(argv[1]);
        is >> num;
        if (!is)
        {
            std::cerr << "Illegal number '" << argv[1] << "'" << std::endl;
            return 1;
        }
    }
   
    for(int i=0;i<NTIMES;i++)
      value = Fibonacci(num);

    unsigned long fib = Fibonacci(num);
    std::cout << "Entry number " << num << " in the Fibonacci sequence is " << fib << std::endl;
    return 0;
}


unsigned long Fibonacci(unsigned long num)
{
    int result = 1;
    if (num > 2)
        result = Fibonacci(num-1) + Fibonacci(num-2);
    
    return result;
}
