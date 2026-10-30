/*
 *  Enables an IOPMSystemSleepType registry property
 *  that can be read by various device drivers
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "SltpSsdt", 1)
{    
    Name (SLTP, Zero)
    
    Method (_TTS, 1, NotSerialized)
    {
        SLTP = Arg0
    }
}
