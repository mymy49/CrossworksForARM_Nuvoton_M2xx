//
// hello.cpp : M480 hello world example.
//

#include <__debug_stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  int i;

  for (i = 0; i < 100; i++)
    debug_printf("Hello World %d!\n", i);

  debug_exit(EXIT_SUCCESS);
}
