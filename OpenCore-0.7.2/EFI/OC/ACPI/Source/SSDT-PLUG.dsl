DefinitionBlock ("", "SSDT", 1, "vulgo", "PlugSsdt", 1)
{        
    External (_PR_.CPU0, DeviceObj)
    
    Scope (\_PR.CPU0)
    {

        Method (_DSM, 4, NotSerialized)
        {            
            Local0 = _OSI ("Darwin")
            
            If (!Local0)
            {
                Return (Buffer ()
                {
                    Zero
                })
            }
            
            If (!Arg2)
            {
                Return (Buffer ()
                {
                    0x03
                })
            }

            Return (Package ()
            {
                "plugin-type", 
                One
            })
        }
    }
}
