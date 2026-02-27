/*
 *  Enables X86PlatformPlugin
 *  Conflicts with certain CPUFriend SSDTs but not CPUFriendDataProvider.kext
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "PlugSsdt", 1)
{        
    External (_PR_.CPU0, DeviceObj)
    
    If (_OSI ("Darwin"))
    {    
        Method (_PR_.CPU0._DSM, 4, NotSerialized)
        { 
            If (!Arg2)
            {
                Return (Buffer (One) { 0x3 })
            }

            Return (Package ()
            {
                "plugin-type", One
            })
        }
    }
}
