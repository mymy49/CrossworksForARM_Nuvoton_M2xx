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

function Reset()
{
  if (TargetInterface.implementation() == "j-link")
    TargetInterface.resetAndStop(1000);
  else
    {
      TargetInterface.pokeWord(0xE000EDF0, 0xA05F0003); // set C_HALT and C_DEBUGEN in DHCSR
      TargetInterface.waitForDebugState(1000);
      TargetInterface.pokeWord(0xE000EDFC, 0x1); // set VC_CORERESET in DEMCR
      TargetInterface.pokeWord(0xE000ED0C, 0x05FA0004); // set SYSRESETREQ in AIRCR
      TargetInterface.waitForDebugState(1000);
    }
}

function GetPartName()
{
  var id = TargetInterface.peekWord(0x40000000);
  //var n = id & 0xFFFFF;
  //if (n == 0x43312)
    return "M251KG6AE";
  //else if (n == 0x43302)
  //  return "M433LE8AE";
  //return "";
}

function MatchPartName(name)
{
  var partName = GetPartName();

  if (partName == "")
    return false;

  return name.indexOf(partName) == 0;
}

