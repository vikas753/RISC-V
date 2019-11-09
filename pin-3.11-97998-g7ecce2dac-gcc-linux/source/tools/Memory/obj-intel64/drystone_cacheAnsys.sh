gcc drystone_test.c -o drystoneo0.o -O0 
pin -t allcache.so -- ./drystoneo0.o -o drystone_o0.txt
gcc drystone_test.c -o drystoneo1.o -O1 
pin -t allcache.so -- ./drystoneo1.o -o drystone_o1.txt
gcc drystone_test.c -o drystoneo2.o -O2 
pin -t allcache.so -- ./drystoneo2.o -o drystone_o2.txt
gcc drystone_test.c -o drystoneo3.o -O3 
pin -t allcache.so -- ./drystoneo3.o -o drystone_o3.txt


