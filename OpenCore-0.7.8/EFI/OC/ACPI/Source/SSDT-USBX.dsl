/*
 *  Provides USB host controller device properties
 *  Likely conflicts with any SSDT with USBX in the name
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "UsbxSsdt", 1)
{
    If (_OSI ("Darwin"))
    {
        Device (_SB.USBX)
        {
            Name (_ADR, Zero)
        }
        
        Method (_SB.USBX._DSM, 4, NotSerialized)
        {
            If (!Arg2)
            {
                Return (Buffer (One) { 0x3 })
            }

            Return (Package ()
            {
                "kUSBSleepPortCurrentLimit", 2100, 
                "kUSBSleepPowerSupply", 5100, 
                "kUSBWakePortCurrentLimit", 2100, 
                "kUSBWakePowerSupply", 5100
            })
        }
    }
}
