DefinitionBlock ("", "SSDT", 1, "vulgo", "SltpSsdt", 1)
{    
    Name (SLTP, Zero)
    
    Method (_TTS, 1, NotSerialized)
    {
        SLTP = Arg0
    }
}