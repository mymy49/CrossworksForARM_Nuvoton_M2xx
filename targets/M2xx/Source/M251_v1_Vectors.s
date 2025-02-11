/*****************************************************************************
 * Copyright (c) 2023 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *                                                                           *
 *****************************************************************************/

/*****************************************************************************
 *                         Preprocessor Definitions                          *
 *                         ------------------------                          *
 * STARTUP_FROM_RESET                                                        *
 *                                                                           *
 *   If defined, the program will startup from power-on/reset. If not        *
 *   defined the program will just loop endlessly from power-on/reset.       *
 *                                                                           *
 * VECTORS_IN_RAM                                                            *
 *                                                                           *
 *   If defined, an area of RAM will large enough to store the vector table  *
 *   will be reserved.                                                       *
 *                                                                           *
 *****************************************************************************/

  .syntax unified
  .code 16

  .section .init, "ax"
  .balign 4

/*****************************************************************************
 * Default Exception Handlers                                                *
 *****************************************************************************/

#ifndef STARTUP_FROM_RESET

  .thumb_func
  .weak Reset_Wait
Reset_Wait:
  b .

#endif

  .thumb_func
  .weak NMI_Handler
NMI_Handler:
  b .

  .thumb_func
  .weak HardFault_Handler
HardFault_Handler:
  b .

  .thumb_func
  .weak MemManage_Handler
MemManage_Handler:
  b .

  .thumb_func
  .weak BusFault_Handler
BusFault_Handler:
  b .

  .thumb_func
  .weak UsageFault_Handler
UsageFault_Handler:
  b .

  .thumb_func
  .weak SVC_Handler
SVC_Handler:
  b .

  .thumb_func
  .weak DebugMon_Handler
DebugMon_Handler:
  b .

  .thumb_func
  .weak PendSV_Handler
PendSV_Handler:
  b .

  .thumb_func
  .weak SysTick_Handler
SysTick_Handler:
  b .

  .thumb_func
Dummy_Handler:
  b .

#if defined(__OPTIMIZATION_SMALL)

  .weak BOD_IRQHandler
  .thumb_set BOD_IRQHandler,Dummy_Handler

  .weak IRC_IRQHandler
  .thumb_set IRC_IRQHandler,Dummy_Handler

  .weak PWRWU_IRQHandler
  .thumb_set PWRWU_IRQHandler,Dummy_Handler

  .weak RAMPE_IRQHandler
  .thumb_set RAMPE_IRQHandler,Dummy_Handler

  .weak CKFAIL_IRQHandler
  .thumb_set CKFAIL_IRQHandler,Dummy_Handler

  .weak RTC_IRQHandler
  .thumb_set RTC_IRQHandler,Dummy_Handler

  .weak TAMPER_IRQHandler
  .thumb_set TAMPER_IRQHandler,Dummy_Handler

  .weak WDT_IRQHandler
  .thumb_set WDT_IRQHandler,Dummy_Handler

  .weak WWDT_IRQHandler
  .thumb_set WWDT_IRQHandler,Dummy_Handler

  .weak EINT0_IRQHandler
  .thumb_set EINT0_IRQHandler,Dummy_Handler

  .weak EINT1_IRQHandler
  .thumb_set EINT1_IRQHandler,Dummy_Handler

  .weak EINT2_IRQHandler
  .thumb_set EINT2_IRQHandler,Dummy_Handler

  .weak EINT3_IRQHandler
  .thumb_set EINT3_IRQHandler,Dummy_Handler

  .weak EINT4_IRQHandler
  .thumb_set EINT4_IRQHandler,Dummy_Handler

  .weak EINT5_IRQHandler
  .thumb_set EINT5_IRQHandler,Dummy_Handler

  .weak GPA_IRQHandler
  .thumb_set GPA_IRQHandler,Dummy_Handler

  .weak GPB_IRQHandler
  .thumb_set GPB_IRQHandler,Dummy_Handler

  .weak GPC_IRQHandler
  .thumb_set GPC_IRQHandler,Dummy_Handler

  .weak GPD_IRQHandler
  .thumb_set GPD_IRQHandler,Dummy_Handler

  .weak GPE_IRQHandler
  .thumb_set GPE_IRQHandler,Dummy_Handler

  .weak GPF_IRQHandler
  .thumb_set GPF_IRQHandler,Dummy_Handler

  .weak QSPI0_IRQHandler
  .thumb_set QSPI0_IRQHandler,Dummy_Handler

  .weak SPI0_IRQHandler
  .thumb_set SPI0_IRQHandler,Dummy_Handler

  .weak BRAKE0_IRQHandler
  .thumb_set BRAKE0_IRQHandler,Dummy_Handler

  .weak EPWM0P0_IRQHandler
  .thumb_set EPWM0P0_IRQHandler,Dummy_Handler

  .weak EPWM0P1_IRQHandler
  .thumb_set EPWM0P1_IRQHandler,Dummy_Handler

  .weak EPWM0P2_IRQHandler
  .thumb_set EPWM0P2_IRQHandler,Dummy_Handler

  .weak BRAKE1_IRQHandler
  .thumb_set BRAKE1_IRQHandler,Dummy_Handler

  .weak EPWM1P0_IRQHandler
  .thumb_set EPWM1P0_IRQHandler,Dummy_Handler

  .weak EPWM1P1_IRQHandler
  .thumb_set EPWM1P1_IRQHandler,Dummy_Handler

  .weak EPWM1P2_IRQHandler
  .thumb_set EPWM1P2_IRQHandler,Dummy_Handler

  .weak TMR0_IRQHandler
  .thumb_set TMR0_IRQHandler,Dummy_Handler

  .weak TMR1_IRQHandler
  .thumb_set TMR1_IRQHandler,Dummy_Handler

  .weak TMR2_IRQHandler
  .thumb_set TMR2_IRQHandler,Dummy_Handler

  .weak TMR3_IRQHandler
  .thumb_set TMR3_IRQHandler,Dummy_Handler

  .weak UART0_IRQHandler
  .thumb_set UART0_IRQHandler,Dummy_Handler

  .weak UART1_IRQHandler
  .thumb_set UART1_IRQHandler,Dummy_Handler

  .weak I2C0_IRQHandler
  .thumb_set I2C0_IRQHandler,Dummy_Handler

  .weak I2C1_IRQHandler
  .thumb_set I2C1_IRQHandler,Dummy_Handler

  .weak PDMA_IRQHandler
  .thumb_set PDMA_IRQHandler,Dummy_Handler

  .weak DAC_IRQHandler
  .thumb_set DAC_IRQHandler,Dummy_Handler

  .weak EADC00_IRQHandler
  .thumb_set EADC00_IRQHandler,Dummy_Handler

  .weak EADC01_IRQHandler
  .thumb_set EADC01_IRQHandler,Dummy_Handler

  .weak ACMP01_IRQHandler
  .thumb_set ACMP01_IRQHandler,Dummy_Handler

  .weak EADC02_IRQHandler
  .thumb_set EADC02_IRQHandler,Dummy_Handler

  .weak EADC03_IRQHandler
  .thumb_set EADC03_IRQHandler,Dummy_Handler

  .weak UART2_IRQHandler
  .thumb_set UART2_IRQHandler,Dummy_Handler

  .weak UART3_IRQHandler
  .thumb_set UART3_IRQHandler,Dummy_Handler

  .weak QSPI1_IRQHandler
  .thumb_set QSPI1_IRQHandler,Dummy_Handler

  .weak SPI1_IRQHandler
  .thumb_set SPI1_IRQHandler,Dummy_Handler

  .weak SPI2_IRQHandler
  .thumb_set SPI2_IRQHandler,Dummy_Handler

  .weak USBD_IRQHandler
  .thumb_set USBD_IRQHandler,Dummy_Handler

  .weak OHCI_IRQHandler
  .thumb_set OHCI_IRQHandler,Dummy_Handler

  .weak USBOTG_IRQHandler
  .thumb_set USBOTG_IRQHandler,Dummy_Handler

  .weak CAN0_IRQHandler
  .thumb_set CAN0_IRQHandler,Dummy_Handler

  .weak CAN1_IRQHandler
  .thumb_set CAN1_IRQHandler,Dummy_Handler

  .weak SC0_IRQHandler
  .thumb_set SC0_IRQHandler,Dummy_Handler

  .weak SC1_IRQHandler
  .thumb_set SC1_IRQHandler,Dummy_Handler

  .weak SC2_IRQHandler
  .thumb_set SC2_IRQHandler,Dummy_Handler

  .weak SPI3_IRQHandler
  .thumb_set SPI3_IRQHandler,Dummy_Handler

  .weak SDH0_IRQHandler
  .thumb_set SDH0_IRQHandler,Dummy_Handler

  .weak USBD20_IRQHandler
  .thumb_set USBD20_IRQHandler,Dummy_Handler

  .weak EMAC_TX_IRQHandler
  .thumb_set EMAC_TX_IRQHandler,Dummy_Handler

  .weak EMAC_RX_IRQHandler
  .thumb_set EMAC_RX_IRQHandler,Dummy_Handler

  .weak I2S0_IRQHandler
  .thumb_set I2S0_IRQHandler,Dummy_Handler

  .weak OPA0_IRQHandler
  .thumb_set OPA0_IRQHandler,Dummy_Handler

  .weak CRYPTO_IRQHandler
  .thumb_set CRYPTO_IRQHandler,Dummy_Handler

  .weak GPG_IRQHandler
  .thumb_set GPG_IRQHandler,Dummy_Handler

  .weak EINT6_IRQHandler
  .thumb_set EINT6_IRQHandler,Dummy_Handler

  .weak UART4_IRQHandler
  .thumb_set UART4_IRQHandler,Dummy_Handler

  .weak UART5_IRQHandler
  .thumb_set UART5_IRQHandler,Dummy_Handler

  .weak USCI0_IRQHandler
  .thumb_set USCI0_IRQHandler,Dummy_Handler

  .weak USCI1_IRQHandler
  .thumb_set USCI1_IRQHandler,Dummy_Handler

  .weak BPWM0_IRQHandler
  .thumb_set BPWM0_IRQHandler,Dummy_Handler

  .weak BPWM1_IRQHandler
  .thumb_set BPWM1_IRQHandler,Dummy_Handler

  .weak SPIM_IRQHandler
  .thumb_set SPIM_IRQHandler,Dummy_Handler

  .weak CCAP_IRQHandler
  .thumb_set CCAP_IRQHandler,Dummy_Handler

  .weak I2C2_IRQHandler
  .thumb_set I2C2_IRQHandler,Dummy_Handler

  .weak QEI0_IRQHandler
  .thumb_set QEI0_IRQHandler,Dummy_Handler

  .weak QEI1_IRQHandler
  .thumb_set QEI1_IRQHandler,Dummy_Handler

  .weak ECAP0_IRQHandler
  .thumb_set ECAP0_IRQHandler,Dummy_Handler

  .weak ECAP1_IRQHandler
  .thumb_set ECAP1_IRQHandler,Dummy_Handler

  .weak GPH_IRQHandler
  .thumb_set GPH_IRQHandler,Dummy_Handler

  .weak EINT7_IRQHandler
  .thumb_set EINT7_IRQHandler,Dummy_Handler

  .weak SDH1_IRQHandler
  .thumb_set SDH1_IRQHandler,Dummy_Handler

  .weak EHCI_IRQHandler
  .thumb_set EHCI_IRQHandler,Dummy_Handler

  .weak USBOTG20_IRQHandler
  .thumb_set USBOTG20_IRQHandler,Dummy_Handler

  .weak TRNG_IRQHandler
  .thumb_set TRNG_IRQHandler,Dummy_Handler

  .weak UART6_IRQHandler
  .thumb_set UART6_IRQHandler,Dummy_Handler

  .weak UART7_IRQHandler
  .thumb_set UART7_IRQHandler,Dummy_Handler

  .weak EADC10_IRQHandler
  .thumb_set EADC10_IRQHandler,Dummy_Handler

  .weak EADC11_IRQHandler
  .thumb_set EADC11_IRQHandler,Dummy_Handler

  .weak EADC12_IRQHandler
  .thumb_set EADC12_IRQHandler,Dummy_Handler

  .weak EADC13_IRQHandler
  .thumb_set EADC13_IRQHandler,Dummy_Handler

  .weak CAN2_IRQHandler
  .thumb_set CAN2_IRQHandler,Dummy_Handler

#else

  .thumb_func
  .weak BOD_IRQHandler
BOD_IRQHandler:
  b .

  .thumb_func
  .weak IRC_IRQHandler
IRC_IRQHandler:
  b .

  .thumb_func
  .weak PWRWU_IRQHandler
PWRWU_IRQHandler:
  b .

  .thumb_func
  .weak RAMPE_IRQHandler
RAMPE_IRQHandler:
  b .

  .thumb_func
  .weak CKFAIL_IRQHandler
CKFAIL_IRQHandler:
  b .

  .thumb_func
  .weak RTC_IRQHandler
RTC_IRQHandler:
  b .

  .thumb_func
  .weak TAMPER_IRQHandler
TAMPER_IRQHandler:
  b .

  .thumb_func
  .weak WDT_IRQHandler
WDT_IRQHandler:
  b .

  .thumb_func
  .weak WWDT_IRQHandler
WWDT_IRQHandler:
  b .

  .thumb_func
  .weak EINT0_IRQHandler
EINT0_IRQHandler:
  b .

  .thumb_func
  .weak EINT1_IRQHandler
EINT1_IRQHandler:
  b .

  .thumb_func
  .weak EINT2_IRQHandler
EINT2_IRQHandler:
  b .

  .thumb_func
  .weak EINT3_IRQHandler
EINT3_IRQHandler:
  b .

  .thumb_func
  .weak EINT4_IRQHandler
EINT4_IRQHandler:
  b .

  .thumb_func
  .weak EINT5_IRQHandler
EINT5_IRQHandler:
  b .

  .thumb_func
  .weak GPA_IRQHandler
GPA_IRQHandler:
  b .

  .thumb_func
  .weak GPB_IRQHandler
GPB_IRQHandler:
  b .

  .thumb_func
  .weak GPC_IRQHandler
GPC_IRQHandler:
  b .

  .thumb_func
  .weak GPD_IRQHandler
GPD_IRQHandler:
  b .

  .thumb_func
  .weak GPE_IRQHandler
GPE_IRQHandler:
  b .

  .thumb_func
  .weak GPF_IRQHandler
GPF_IRQHandler:
  b .

  .thumb_func
  .weak QSPI0_IRQHandler
QSPI0_IRQHandler:
  b .

  .thumb_func
  .weak SPI0_IRQHandler
SPI0_IRQHandler:
  b .

  .thumb_func
  .weak BRAKE0_IRQHandler
BRAKE0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P0_IRQHandler
EPWM0P0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P1_IRQHandler
EPWM0P1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P2_IRQHandler
EPWM0P2_IRQHandler:
  b .

  .thumb_func
  .weak BRAKE1_IRQHandler
BRAKE1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P0_IRQHandler
EPWM1P0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P1_IRQHandler
EPWM1P1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P2_IRQHandler
EPWM1P2_IRQHandler:
  b .

  .thumb_func
  .weak TMR0_IRQHandler
TMR0_IRQHandler:
  b .

  .thumb_func
  .weak TMR1_IRQHandler
TMR1_IRQHandler:
  b .

  .thumb_func
  .weak TMR2_IRQHandler
TMR2_IRQHandler:
  b .

  .thumb_func
  .weak TMR3_IRQHandler
TMR3_IRQHandler:
  b .

  .thumb_func
  .weak UART0_IRQHandler
UART0_IRQHandler:
  b .

  .thumb_func
  .weak UART1_IRQHandler
UART1_IRQHandler:
  b .

  .thumb_func
  .weak I2C0_IRQHandler
I2C0_IRQHandler:
  b .

  .thumb_func
  .weak I2C1_IRQHandler
I2C1_IRQHandler:
  b .

  .thumb_func
  .weak PDMA_IRQHandler
PDMA_IRQHandler:
  b .

  .thumb_func
  .weak DAC_IRQHandler
DAC_IRQHandler:
  b .

  .thumb_func
  .weak EADC00_IRQHandler
EADC00_IRQHandler:
  b .

  .thumb_func
  .weak EADC01_IRQHandler
EADC01_IRQHandler:
  b .

  .thumb_func
  .weak ACMP01_IRQHandler
ACMP01_IRQHandler:
  b .

  .thumb_func
  .weak EADC02_IRQHandler
EADC02_IRQHandler:
  b .

  .thumb_func
  .weak EADC03_IRQHandler
EADC03_IRQHandler:
  b .

  .thumb_func
  .weak UART2_IRQHandler
UART2_IRQHandler:
  b .

  .thumb_func
  .weak UART3_IRQHandler
UART3_IRQHandler:
  b .

  .thumb_func
  .weak QSPI1_IRQHandler
QSPI1_IRQHandler:
  b .

  .thumb_func
  .weak SPI1_IRQHandler
SPI1_IRQHandler:
  b .

  .thumb_func
  .weak SPI2_IRQHandler
SPI2_IRQHandler:
  b .

  .thumb_func
  .weak USBD_IRQHandler
USBD_IRQHandler:
  b .

  .thumb_func
  .weak OHCI_IRQHandler
OHCI_IRQHandler:
  b .

  .thumb_func
  .weak USBOTG_IRQHandler
USBOTG_IRQHandler:
  b .

  .thumb_func
  .weak CAN0_IRQHandler
CAN0_IRQHandler:
  b .

  .thumb_func
  .weak CAN1_IRQHandler
CAN1_IRQHandler:
  b .

  .thumb_func
  .weak SC0_IRQHandler
SC0_IRQHandler:
  b .

  .thumb_func
  .weak SC1_IRQHandler
SC1_IRQHandler:
  b .

  .thumb_func
  .weak SC2_IRQHandler
SC2_IRQHandler:
  b .

  .thumb_func
  .weak SPI3_IRQHandler
SPI3_IRQHandler:
  b .

  .thumb_func
  .weak SDH0_IRQHandler
SDH0_IRQHandler:
  b .

  .thumb_func
  .weak USBD20_IRQHandler
USBD20_IRQHandler:
  b .

  .thumb_func
  .weak EMAC_TX_IRQHandler
EMAC_TX_IRQHandler:
  b .

  .thumb_func
  .weak EMAC_RX_IRQHandler
EMAC_RX_IRQHandler:
  b .

  .thumb_func
  .weak I2S0_IRQHandler
I2S0_IRQHandler:
  b .

  .thumb_func
  .weak OPA0_IRQHandler
OPA0_IRQHandler:
  b .

  .thumb_func
  .weak CRYPTO_IRQHandler
CRYPTO_IRQHandler:
  b .

  .thumb_func
  .weak GPG_IRQHandler
GPG_IRQHandler:
  b .

  .thumb_func
  .weak EINT6_IRQHandler
EINT6_IRQHandler:
  b .

  .thumb_func
  .weak UART4_IRQHandler
UART4_IRQHandler:
  b .

  .thumb_func
  .weak UART5_IRQHandler
UART5_IRQHandler:
  b .

  .thumb_func
  .weak USCI0_IRQHandler
USCI0_IRQHandler:
  b .

  .thumb_func
  .weak USCI1_IRQHandler
USCI1_IRQHandler:
  b .

  .thumb_func
  .weak BPWM0_IRQHandler
BPWM0_IRQHandler:
  b .

  .thumb_func
  .weak BPWM1_IRQHandler
BPWM1_IRQHandler:
  b .

  .thumb_func
  .weak SPIM_IRQHandler
SPIM_IRQHandler:
  b .

  .thumb_func
  .weak CCAP_IRQHandler
CCAP_IRQHandler:
  b .

  .thumb_func
  .weak I2C2_IRQHandler
I2C2_IRQHandler:
  b .

  .thumb_func
  .weak QEI0_IRQHandler
QEI0_IRQHandler:
  b .

  .thumb_func
  .weak QEI1_IRQHandler
QEI1_IRQHandler:
  b .

  .thumb_func
  .weak ECAP0_IRQHandler
ECAP0_IRQHandler:
  b .

  .thumb_func
  .weak ECAP1_IRQHandler
ECAP1_IRQHandler:
  b .

  .thumb_func
  .weak GPH_IRQHandler
GPH_IRQHandler:
  b .

  .thumb_func
  .weak EINT7_IRQHandler
EINT7_IRQHandler:
  b .

  .thumb_func
  .weak SDH1_IRQHandler
SDH1_IRQHandler:
  b .

  .thumb_func
  .weak EHCI_IRQHandler
EHCI_IRQHandler:
  b .

  .thumb_func
  .weak USBOTG20_IRQHandler
USBOTG20_IRQHandler:
  b .

  .thumb_func
  .weak TRNG_IRQHandler
TRNG_IRQHandler:
  b .

  .thumb_func
  .weak UART6_IRQHandler
UART6_IRQHandler:
  b .

  .thumb_func
  .weak UART7_IRQHandler
UART7_IRQHandler:
  b .

  .thumb_func
  .weak EADC10_IRQHandler
EADC10_IRQHandler:
  b .

  .thumb_func
  .weak EADC11_IRQHandler
EADC11_IRQHandler:
  b .

  .thumb_func
  .weak EADC12_IRQHandler
EADC12_IRQHandler:
  b .

  .thumb_func
  .weak EADC13_IRQHandler
EADC13_IRQHandler:
  b .

  .thumb_func
  .weak CAN2_IRQHandler
CAN2_IRQHandler:
  b .

#endif

/*****************************************************************************
 * Vector Table                                                              *
 *****************************************************************************/

  .section .vectors, "ax"
  .balign 512
  .global _vectors
  .extern __stack_end__
#ifdef STARTUP_FROM_RESET
  .extern Reset_Handler
#endif

_vectors:
  .word __stack_end__
#ifdef STARTUP_FROM_RESET
  .word Reset_Handler
#else
  .word Reset_Wait
#endif
  .word NMI_Handler
  .word HardFault_Handler
  .word MemManage_Handler
  .word BusFault_Handler
  .word UsageFault_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word SVC_Handler
  .word DebugMon_Handler
  .word 0 /* Reserved */
  .word PendSV_Handler
  .word SysTick_Handler
  .word BOD_IRQHandler
  .word IRC_IRQHandler
  .word PWRWU_IRQHandler
  .word RAMPE_IRQHandler
  .word CKFAIL_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word RTC_IRQHandler
  .word TAMPER_IRQHandler
  .word WDT_IRQHandler
  .word WWDT_IRQHandler
  .word EINT0_IRQHandler
  .word EINT1_IRQHandler
  .word EINT2_IRQHandler
  .word EINT3_IRQHandler
  .word EINT4_IRQHandler
  .word EINT5_IRQHandler
  .word GPA_IRQHandler
  .word GPB_IRQHandler
  .word GPC_IRQHandler
  .word GPD_IRQHandler
  .word GPE_IRQHandler
  .word GPF_IRQHandler
  .word QSPI0_IRQHandler
  .word SPI0_IRQHandler
  .word BRAKE0_IRQHandler
  .word EPWM0P0_IRQHandler
  .word EPWM0P1_IRQHandler
  .word EPWM0P2_IRQHandler
  .word BRAKE1_IRQHandler
  .word EPWM1P0_IRQHandler
  .word EPWM1P1_IRQHandler
  .word EPWM1P2_IRQHandler
  .word TMR0_IRQHandler
  .word TMR1_IRQHandler
  .word TMR2_IRQHandler
  .word TMR3_IRQHandler
  .word UART0_IRQHandler
  .word UART1_IRQHandler
  .word I2C0_IRQHandler
  .word I2C1_IRQHandler
  .word PDMA_IRQHandler
  .word DAC_IRQHandler
  .word EADC00_IRQHandler
  .word EADC01_IRQHandler
  .word ACMP01_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word EADC02_IRQHandler
  .word EADC03_IRQHandler
  .word UART2_IRQHandler
  .word UART3_IRQHandler
  .word QSPI1_IRQHandler
  .word SPI1_IRQHandler
  .word SPI2_IRQHandler
  .word USBD_IRQHandler
  .word OHCI_IRQHandler
  .word USBOTG_IRQHandler
  .word CAN0_IRQHandler
  .word CAN1_IRQHandler
  .word SC0_IRQHandler
  .word SC1_IRQHandler
  .word SC2_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word SPI3_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word SDH0_IRQHandler
  .word USBD20_IRQHandler
  .word EMAC_TX_IRQHandler
  .word EMAC_RX_IRQHandler
  .word I2S0_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word OPA0_IRQHandler
  .word CRYPTO_IRQHandler
  .word GPG_IRQHandler
  .word EINT6_IRQHandler
  .word UART4_IRQHandler
  .word UART5_IRQHandler
  .word USCI0_IRQHandler
  .word USCI1_IRQHandler
  .word BPWM0_IRQHandler
  .word BPWM1_IRQHandler
  .word SPIM_IRQHandler
  .word CCAP_IRQHandler
  .word I2C2_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word QEI0_IRQHandler
  .word QEI1_IRQHandler
  .word ECAP0_IRQHandler
  .word ECAP1_IRQHandler
  .word GPH_IRQHandler
  .word EINT7_IRQHandler
  .word SDH1_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word EHCI_IRQHandler
  .word USBOTG20_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word TRNG_IRQHandler
  .word UART6_IRQHandler
  .word UART7_IRQHandler
  .word EADC10_IRQHandler
  .word EADC11_IRQHandler
  .word EADC12_IRQHandler
  .word EADC13_IRQHandler
  .word CAN2_IRQHandler
_vectors_end:

#ifdef VECTORS_IN_RAM
  .section .vectors_ram, "ax"
  .balign 512
  .global _vectors_ram

_vectors_ram:
  .space _vectors_end - _vectors, 0
#endif
