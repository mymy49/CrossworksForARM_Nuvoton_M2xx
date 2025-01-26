
int Init(unsigned long adr, unsigned long clk, unsigned long fnc)
{
    return 0;
}

int UnInit(unsigned long fnc)
{
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
    return 0;
}

int ProgramPage(unsigned long adr, unsigned long sz, unsigned char *buf)
{
    return 0;
}

unsigned long Verify(unsigned long adr, unsigned long sz, unsigned char *buf)
{
    return 0;
}


