DefinitionBlock ("", "SSDT", 1, "vulgo", "h97nwifi", 0x0000FFFF)
{
    External (_PR_.CPU0, DeviceObj)

    Name (SLTP, Zero)    
    Method (_TTS, 1, NotSerialized)
    {
        SLTP = Arg0
    }

    Scope (_GPE)
    {
        Name (LXEN, One)
    }
    
    Scope (_SB)
    {
        Name (LPS0, Zero)
    }

    Scope (_PR.CPU0)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)
            {
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
}

