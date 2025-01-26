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

#include "libmem_m2xx.h"
#include <NuMicro.h>
#include <libmem_flm_driver.h>

#if defined(FLM_ALGORITHM_M2xx_AP_256)

// M2xx 128kB Flash AP

#define FLM_START_ADDRESS 0x00000000
#define FLM_SIZE 0x00040000
#define FLM_PAGE_SIZE 0x00001000

static const libmem_geometry_t geometry[] =
{
  { 0x40, 0x1000 },
  { 0, 0 } 
};

#else

#error unknown FLM algorithm

#endif

static uint8_t write_buffer[FLM_PAGE_SIZE];

int
libmem_m480_register_internal_flash_driver(libmem_driver_handle_t *h, uint32_t clk)
{
  return libmem_register_flm_driver(h, (uint8_t *)FLM_START_ADDRESS, FLM_SIZE, geometry, write_buffer, sizeof(write_buffer), clk);
}
