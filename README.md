# H97N-WIFI Hackintosh

OpenCore configuration for running macOS 12 on the Gigabyte GA-H97N-WIFI motherboard.

#### Notes

- Nvidia graphics cards are not supported
- H97N-WIFI firmware has complete support for NVMe drives installed in the PCIe slot
- If you want WiFi search the internet for mini-PCIe-m.2 adapters and Broadcom m.2 WiFi and bluetooth hardware with native macOS 12 support

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
| Intel Processor Graphics Memory Allocation   | 96M      |
| DVMT Total Memory Size                       | MAX      |
| Legacy USB Support                           | Disabled |
| XHCI Handoff                                 | Enabled  |
| Super IO Configuration &#8594; Serial Port A | Disabled |

Source: [dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings](https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html#intel-bios-settings)

## Graphics

The default configuration targets discrete AMD graphics + Haswell iGPU using a connectorless framebuffer.

> If your system is AMD + Haswell connectorless then graphics-related changes to the default ```config.plist``` may not be required

In all other cases, refer to [README-Intel-Graphics.md](/README/README-Intel-Graphics.md)

## SMBIOS

Before installing macOS it is useful to generate certain serial numbers and identifiers.

Refer to [README-SMBIOS.md](/README/README-SMBIOS.md)

## Reset NVRAM

At the picker, **press space**, choose ```Reset NVRAM```.

Reset NVRAM at first boot and **whenever the bootloader files have changed**.

## USB

Generate a valid ```USBPorts.kext```. See [README-usbtool.command.md](/README/README-usbtool.command.md)

## Post-Install

[dortania.github.io/OpenCore-Post-Install/](https://dortania.github.io/OpenCore-Post-Install/)
