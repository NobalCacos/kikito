/*
 *  Enables AppleSMBusController, adds MCHC device
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "SMBusMC", 1)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Device (_SB.PCI0.MCHC)
        {
            Name (_ADR, Zero)
            Name (_STA, 0xF)
        }

        Device (_SB.PCI0.SBUS.BUS0)
        {
            Name (_STA, 0xF)
            Name (_CID, "smbus")
            Name (_ADR, Zero)
        }
            
        Device (_SB.PCI0.SBUS.BUS0.DVL0)
        {
            Name (_ADR, 0x57)
            Name (_CID, "diagsvault")
        }
        
        Method (_SB.PCI0.SBUS.BUS0.DVL0._DSM, 4, NotSerialized)
        {
            If (!Arg2)
            {
                Return (Buffer (One) { 0x57 })
            }

            Return (Package ()
            {
                "address", 0x57
            })
        }
    }
}
