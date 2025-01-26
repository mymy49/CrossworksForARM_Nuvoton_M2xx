//
// systick.cpp : M480 SysTick timer interrupt example.
//

#include <__debug_stdio.h>
#include <NuMicro.h>
#include <stdlib.h>

static volatile int ticks = 0;

extern "C" void SysTick_Handler(void)
{
  ticks++;
}

static void delay(int n)
{
  unsigned endTicks = ticks + n;
  while (ticks < endTicks);
}

int main(int argc, char *argv[])
{
  // Enable SysTick timer interrupt
  SysTick->LOAD = (SystemCoreClock / 1000) - 1;
  SysTick->VAL = 0;
  SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;

  // Display tick count
  while (ticks < 100000)
    {
      debug_printf("ticks = %d\n", ticks);
      delay(1000);
    }

  // Disable SysTick interrupt
  SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;

  debug_exit(EXIT_SUCCESS);
}
