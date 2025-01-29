DefinitionBlock ("", "SSDT", 1, "vulgo", "UsbxSsdt", 1)
{
    If (_OSI ("Darwin"))
    {
        Device (_SB.USBX)
        {
            Name (_ADR, Zero)
            
            Method (_DSM, 4, NotSerialized)
            {
                If (!Arg2)
                {
                    Return (Buffer ()
                    {
                         0x3
                    })
                }

                Return (Package ()
                {
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC
                })
            }
        }
    }
}
