#include <NuMicro.h>
#include <__debug_stdio.h>

#define FMC_ISPCMD_FLASH_READ					(0x00)
#define FMC_ISPCME_FLASH_READ_64BIT				(0x40)
#define FMC_ISPCMD_READ_UNIQUE_ID				(0x04)
#define FMC_ISPCMD_READ_FLASH_ALL_ONE_READ		(0x08)
#define FMC_ISPCMD_READ_COMPANY_ID				(0x0B)
#define FMC_ISPCMD_READ_DEVICE_ID				(0x0C)
#define FMC_ISPCMD_READ_CHECKSUM				(0x0D)
#define FMC_ISPCMD_FLASH_32BIT_PROGRAM			(0x21)
#define FMC_ISPCMD_FLASH_PAGE_ERASE				(0x22)
#define FMC_ISPCMD_FLASH_BANK_ERASE				(0x23)
#define FMC_ISPCMD_FLASH_BLOCK_ERASE			(0x25)
#define FMC_ISPCMD_FLASH_MULTI_WORD				(0x27)

void executeCommand(uint8_t cmd)
{
	FMC->ISPCTL |= FMC_ISPCTL_APUEN_Msk;
	FMC->ISPCMD = cmd;
	FMC->ISPTRG = FMC_ISPTRG_ISPGO_Msk;
	
	while(FMC->ISPTRG & FMC_ISPTRG_ISPGO_Msk)
		;

	FMC->ISPCTL &= ~FMC_ISPCTL_APUEN_Msk;
}

int Init(unsigned long adr, unsigned long clk, unsigned long fnc)
{
	uint32_t  reg; 
	
	// unlock
	SYS->REGLCTL = 0x59;
	SYS->REGLCTL = 0x16;
	SYS->REGLCTL = 0x88;

	CLK->PWRCTL |= CLK_PWRCTL_HIRCEN_Msk;
	CLK->AHBCLK |= CLK_AHBCLK_ISPCKEN_Msk;
	
	for(volatile uint32_t i = 0; i < 0x80; i++)
		;

	// HCLK 소스를 HIRC로 변경
	FMC->CYCCTL = 3;

	reg = CLK->PCLKDIV;
	reg &= ~(CLK_PCLKDIV_APB0DIV_Msk | CLK_PCLKDIV_APB1DIV_Msk);
	reg |= (1 << CLK_PCLKDIV_APB0DIV_Pos) | (1 << CLK_PCLKDIV_APB1DIV_Pos);
	CLK->PCLKDIV = reg;

	reg = CLK->CLKSEL0;
	reg &= ~CLK_CLKSEL0_HCLKSEL_Msk;
	reg |= 7 << CLK_CLKSEL0_HCLKSEL_Pos;
	CLK->CLKSEL0 = reg;
	
	for(volatile uint32_t i = 0; i < 0x300; i++)
		;

	FMC->ISPCTL |= FMC_ISPCTL_ISPEN_Msk | FMC_ISPCTL_LDUEN_Msk;

	if(FMC->ISPCTL & FMC_ISPCTL_ISPEN_Msk)
		FMC->ISPCTL |= FMC_ISPCTL_ISPFF_Msk;

    return 0;
}
int UnInit(unsigned long fnc)
{
	uint32_t reg;

	// 작업이 완료 안됐으면 대기
	while(FMC->ISPTRG & FMC_ISPTRG_ISPGO_Msk)
		;
	
	FMC->ISPCTL &= ~(FMC_ISPCTL_ISPEN_Msk | FMC_ISPCTL_LDUEN_Msk);

    return 0;
}

int BlankCheck(unsigned long adr, unsigned long sz, unsigned char pat)
{
    return 0;
}

int EraseChip(void)
{
    return 0;
}

int EraseSector(unsigned long adr)
{
	while(FMC->MPSTS & FMC_MPSTS_MPBUSY_Msk)
		;
	
	FMC->ISPCTL |= FMC_ISPCTL_ISPFF_Msk;

	FMC->ISPADDR = adr;

	executeCommand(FMC_ISPCMD_FLASH_PAGE_ERASE);
	
	return 0;
}

int ProgramPage(unsigned long adr, unsigned long sz, unsigned char *buf)
{
	uint32_t *src = (uint32_t*)buf;
	uint32_t *addr = (uint32_t*)adr;

	sz /= 4;

	for(uint32_t i = 0; i < sz; i++)
	{ 
		FMC->ISPADDR = (uint32_t)addr++;
		FMC->MPDAT0 = *src++;

		executeCommand(FMC_ISPCMD_FLASH_32BIT_PROGRAM);
	}

    return 0;
}

unsigned long Verify(unsigned long adr, unsigned long sz, unsigned char *buf)
{
    return 0;
}


