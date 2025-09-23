# H97N-WIFI Hackintosh

OpenCore configuration for running macOS 12 on the Gigabyte GA-H97N-WIFI motherboard.

<details><summary><strong>Notes</strong></summary><br>
  
- [TextMate](https://macromates.com/) ([github.com/textmate/textmate](https://github.com/textmate/textmate)) is free software useful for editing `config.plist`
- Nvidia graphics cards are [no longer supported](/README/README-Nvidia.md)
- H97N-WIFI firmware supports NVMe devices in the x16 PCIe slot
- WiFi and Bluetooth work natively in macOS 12 using an m.2 Broadcom BCM94360NG and mini-PCIe-m.2 adapter

</details>

<details><summary><strong>In-scope</strong></summary><br>

- Supported graphics hardware
- Built-in audio
- Built-in ethernet ports
- Wireless hardware natively supported
- macOS installation
- Built-in USB ports
- Sleep, wake, shutdown (ACPI S0, S3, S5)

</details>
    
<details><summary><strong>Out-of-scope</strong></summary><br>

- UEFI Secure Boot
- [Security and FileVault](https://dortania.github.io/OpenCore-Post-Install/universal/security.html)
- Wireless hardware not natively supported
- [CPU power management](https://github.com/acidanthera/CPUFriend/blob/master/Instructions.md/)
- [DRM and hardware video decoding or encoding](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Shiki.en.md/)
- [NVMe problems](https://github.com/acidanthera/NVMeFix/)
- Hibernation (ACPI S4)

</details>

<details><summary><strong>Credits</strong></summary><br>

- [acidanthera](https://github.com/acidanthera)
- [apple](https://github.com/apple)
- [corpnewt](https://github.com/corpnewt)
- [dortania](https://github.com/dortania)
- [mieze](https://github.com/Mieze)
- [Piker-Alpha](https://github.com/Piker-Alpha)
- [RehabMan](https://github.com/RehabMan)

</details>

## Firmware Settings

#### BIOS Features

| Field              | Value             |
|:-------------------|------------------:|
| Fast Boot          | Disabled          |
| VT-d               | Enabled           |
| Windows 8 Features | Windows 8 WHQL    |
| CSM Support        | Never             |
| Secure Boot        | Disabled          |

#### Peripherals

| Field                                        | Value    |
|:---------------------------------------------|---------:|
| XHCI Mode                                    | Enabled  |
| Intel Processor Graphics                     | Enabled  |
| Intel Processor Graphics Memory Allocation   | *96M\**  |
| DVMT Total Memory Size                       | MAX      |
| Legacy USB Support                           | Disabled |
| XHCI Handoff                                 | Enabled  |
| Super IO Configuration &#8594; Serial Port A | Disabled |

*\* 96M Broadwell, 64M Haswell HD Graphics, 32M Haswell connectorless*

Source: [dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings)

## Graphics

The default `config.plist` targets systems with discrete AMD graphics while the Haswell iGPU uses a connectorless framebuffer.

> If your system is AMD + Haswell connectorless then graphics-related changes to the default ```config.plist``` may not be required

In all other cases, refer to [README-Intel-Graphics.md](/README/README-Intel-Graphics.md)

## SMBIOS

Before installing macOS it is useful to generate certain serial numbers and identifiers.

Refer to [README-SMBIOS.md](/README/README-SMBIOS.md)

## Reset NVRAM

At the picker, **press space**, choose ```Reset NVRAM```.

Reset NVRAM at first boot and **whenever the bootloader files have changed**.

# Post-Install

### USB

Generate a valid ```USBPorts.kext```.

Refer to [README-usbtool.command.md](/README/README-usbtool.command.md)

### NVMe

> NVMeFix is a set of patches for the Apple NVMe storage driver, IONVMeFamily. Its goal is to improve compatibility with non-Apple SSDs.

Refer to [github.com/acidanthera/NVMeFix](https://github.com/acidanthera/NVMeFix/)

### Dortania Post-Install

Refer to [dortania.github.io/OpenCore-Post-Install/](https://dortania.github.io/OpenCore-Post-Install/)
