# GA-H97N-WIFI hackintosh

## Firmware Settings

#### BIOS Features

| Field              | Value             |
|:-------------------|------------------:|
| Fast Boot          | Disabled          |
| VT-d               | Disabled          |
| Windows 8 Features | Windows 8 WHQL    |
| CSM Support        | Never             |
| Secure Boot        | Disabled          |

#### Peripherals

| Field                                        | Value    |
|:---------------------------------------------|---------:|
| XHCI Mode                                    | Enabled  |
| Intel Processor Graphics                     | Enabled  |
| Intel Processor Graphics Memory Allocation   | 64M      |
| DVMT Total Memory Size                       | MAX      |
| Legacy USB Support                           | Disabled |
| XHCI Handoff                                 | Enabled  |
| Super IO Configuration &#8594; Serial Port A | Disabled |

Source: [https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings)
  
# Before you boot

#### OpenCore Sanity Checker

[https://opencore.slowgeek.com/](https://opencore.slowgeek.com/)

#### config.plist: DeviceProperties
```
...
<key>DeviceProperties</key>
<dict>
    <key>Add</key>
    <dict>
        ...
        <key>PciRoot(0x0)/Pci(0x2,0x0)</key>
        <dict>
            <key>AAPL,ig-platform-id</key>
            <data>BAASBA==</data>
        </dict>
        ...
    </dict>
</dict>
...
```

| AAPL,ig-platform-id | Base64   | IGPU Configuration          |
|:--------------------|:---------|----------------------------:|
| 0300220D            | AwAiDQ== | Attached display            |
| 04001204            | BAASBA== | Headless (discrete GPU)     |
| 07002216            | BwAiFg== | Broadwell                   |

Source: [https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#deviceproperties](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#deviceproperties)

#### config.plist: PlatformInfo
```
...
<key>PlatformInfo</key>
    <dict>
    ...
    <key>Generic</key>
    <dict>
        ...
        <key>MLB</key>
        <string>M0000000000000001</string>
        ...
        <key>ROM</key>
        <data>ESIzRFVm</data>
        ...
        <key>SystemSerialNumber</key>
        <string>W00000000001</string>
        <key>SystemUUID</key>
        <string>00000000-0000-0000-0000-000000000000</string>
    </dict>
    ...
</dict>
...
````

| PlatformInfo &#8594; Generic | Source                    |
|:-----------------------------|--------------------------:|
| MLB                          | \**Board Serial*          |
| ROM                          | 6 bytes, e.g. MAC address |
| SystemSerialNumber           | \**Serial*                |
| SystemUUID                   | \**SmUUID*                |

\* *GenSMBIOS output, iMac15,1*

Source: [https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#platforminfo](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#platforminfo)

GenSMBIOS: [https://github.com/corpnewt/GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

# First boot

At the picker, **press space**, choose **Reset NVRAM**.

## Post-Install

[https://dortania.github.io/OpenCore-Post-Install/](https://dortania.github.io/OpenCore-Post-Install/)
