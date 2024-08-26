DefinitionBlock ("", "SSDT", 1, "vulgo", "SbMcSsdt", 1)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (\)
        {
            Method (DTGP, 5, NotSerialized)
            {
                If (Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b"))
                {                
                    If (Arg1 == One && Arg2 == Zero)
                    {
                        Arg4 = Buffer () { 0x3 }
                    
                        Return (One)
                    }
                    
                    If (Arg1 == One && Arg2 == One)
                    {
                        Return (One)
                    }
                }

                Arg4 = Buffer () { Zero }
                
                Return (Zero)
            }
        }

        Scope (\_SB.PCI0)
        {
            Device (MCHC)
            {
                Name (_ADR, Zero)
                Name (_STA, 0xF)
            }
        }

        Scope (\_SB.PCI0.SBUS)
        {
            Device (BUS0)
            {
                Name (_STA, 0xF)
                Name (_CID, "smbus")
                Name (_ADR, Zero)
            }
                
            Device (BUS0.DVL0)
            {
                Name (_ADR, 0x57)
                Name (_CID, "diagsvault")
                
                Method (_DSM, 4, NotSerialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer () { 0x57 })
                    }

                    Return (Package ()
                    {
                        "address", 
                        0x57
                    })
                }
            }
        }
    }
}
