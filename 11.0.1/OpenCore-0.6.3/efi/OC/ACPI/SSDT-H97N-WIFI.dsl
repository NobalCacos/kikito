/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-H97N-WIFI.aml, Thu Nov 19 20:21:05 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000F6 (246)
 *     Revision         0x01
 *     Checksum         0xBA
 *     OEM ID           "vulgo"
 *     OEM Table ID     "h97nwifi"
 *     OEM Revision     0x0000FFFF (65535)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 1, "vulgo", "h97nwifi", 0x0000FFFF)
{
    External (_PR_.CPU0, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)

    Name (SLTP, Zero)
    Method (_TTS, 1, NotSerialized)  // _TTS: Transition To State
    {
        SLTP = Arg0
    }

    Scope (_GPE)
    {
        Method (LXEN, 0, NotSerialized)
        {
            Return (One)
        }
    }

    Scope (\_PR.CPU0)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_UID, One)  // _UID: Unique ID
        }
    }
}

