# H97N-WIFI Hackintosh

OpenCore configuration for running macOS 12 on the Gigabyte GA-H97N-WIFI motherboard. Without obsolete or cosmetic patches, the goal is simply macOS 12 working well on compatible hardware.

<details><summary><strong>Notes</strong></summary><br>

- For features listed as `in-scope` that are not working as expected, it may be beneficial for all to open an issue here
- Where something is listed as `out-of-scope` more explicit information will surely be found in various places across the internet, or in the OpenCore documentation
- [TextMate](https://macromates.com/) ([github.com/textmate/textmate](https://github.com/textmate/textmate)) is free software useful for editing `config.plist`
- Nvidia graphics cards are [no longer supported](/README/README-Nvidia.md)
- H97N-WIFI firmware supports NVMe devices in the x16 PCIe slot
- WiFi and Bluetooth work natively in macOS 12 using an m.2 Broadcom BCM94360NG and mini-PCIe-m.2 adapter

</details>

<details><summary><strong><code>in-scope</code></strong></summary><br>

- Accelerated graphics on supported Intel and AMD GPUs
- Built-in audio
- Built-in ethernet
- Airport and Bluetooth using a natively supported device
- CPU power management
- USB
- System wake, sleep, and shutdown
- macOS installation and updates
- System stability

</details>

<details><summary><strong><code>out-of-scope</code></strong></summary><br>

- [Apple ID problems](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html)
- UEFI Secure Boot
- [OpenCore Security and FileVault](https://dortania.github.io/OpenCore-Post-Install/universal/security.html)
- Airport and Bluetooth using a device that is not natively supported
- [DRM and hardware video decoding or encoding](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Shiki.en.md)
- [NVMe problems](https://github.com/acidanthera/NVMeFix)

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

The default `config.plist` in this repo targets Haswell systems with a supported AMD graphics card.

> If your system is AMD + Haswell connectorless iGPU then graphics-related changes to the default ```config.plist``` may not be required

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
