# GA-H97N-WIFI hackintosh

## Before you boot

OpenCore Sanity Checker: [https://opencore.slowgeek.com/](https://opencore.slowgeek.com/)

### config.plist: DeviceProperties->Add

#### PciRoot(0x0)/Pci(0x2,0x0)

| AAPL,ig-platform-id | Configuration                    |
|---------------------|----------------------------------|
| 0300220D            | IGPU attached display            |
| 04001204            | IGPU headless (discrete GPU)     |
| 07002216            | IGPU Broadwell                   |

Source: [https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#deviceproperties](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#deviceproperties)

### config.plist: NVRAM->PlatformInfo->Generic

| GenSMBIOS Output | PlatformInfo->Generic             |
|------------------|-----------------------------------|
| Type             | SystemProductName                 |
| Serial           | SystemSerialNumber                |
| Board Serial     | MLB                               |
| SmUUID           | SystemUUID                        |

Source: [https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#platforminfo](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#platforminfo)

GenSMBIOS: [https://github.com/corpnewt/GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

## First boot

At the picker, **press space**, choose **Reset NVRAM**.