# Intel Graphics

Both HDMI ports should work. Please report any issues or solutions to problems encountered.

<details><summary><strong>Sources</strong></summary><br>

- [acidanthera/WhateverGreen/README](https://github.com/acidanthera/WhateverGreen/blob/master/README.md)
- [acidanthera/WhateverGreen/FAQ/IntelHD](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)
- [acidanthera/WhateverGreen/FAQ/Shiki](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Shiki.en.md)

</details>

## Model Identifier

Edit the ```PlatformInfo``` section of your ```config.plist``` so that the ```SystemProductName``` matches your graphics configuration.

```xml
...
<key>PlatformInfo</key>
<dict>
    ...
    <key>Generic</key>
    <dict>
        ...
        <key>SystemProductName</key>
        <string>iMac18,1</string>
        ...
    </dict>
    ...
</dict>
...
````

| SystemProductName | Graphics Configuration         | Intel Framebuffer |
|:------------------|:-------------------------------|:------------------|
| iMac18,1          | Haswell HD Graphics            | Attached display  |
| iMac16,2          | Broadwell                      | Attached display  |
| iMac18,2          | Haswell PCIe AMD graphics card | Connectorless     |

## iGPU Device Properties

Edit the `DeviceProperties` section of your `config.plist` according to your configuration.

<details><summary><strong>Haswell HD Graphics</strong></summary><br>

> Haswell attached display configurations use the `iMac18,1` model identifier.

```xml
...
<key>DeviceProperties</key>
<dict>
    <key>Add</key>
    <dict>
        ...
        <key>PciRoot(0x0)/Pci(0x2,0x0)</key>
        <dict>
            <key>AAPL,ig-platform-id</key>
            <data>AwAiDQ==</data>
            <key>framebuffer-patch-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con1-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con1-type</key>
            <data>AAgAAA==</data>
            <key>framebuffer-con2-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con2-type</key>
            <data>AAgAAA==</data>
            <key>framebuffer-con2-flags</key>
            <data>hwAAAA==</data>
        </dict>
        ...
    </dict>
</dict>
...
```

</details>

<details><summary><strong>Broadwell</strong></summary><br>

> Broadwell Iris Pro configurations use the `iMac16,2` model identifier. Supported AMD graphics cards should also be working with these properties.

```xml
...
<key>DeviceProperties</key>
<dict>
    <key>Add</key>
    <dict>
        ...
        <key>PciRoot(0x0)/Pci(0x2,0x0)</key>
        <dict>
            <key>AAPL,ig-platform-id</key>
            <data>BwAiFg==</data>
            <key>framebuffer-patch-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con1-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con1-type</key>
            <data>AAgAAA==</data>
            <key>framebuffer-con2-enable</key>
            <data>AQAAAA==</data>
            <key>framebuffer-con2-type</key>
            <data>AAgAAA==</data>
            <key>framebuffer-con2-flags</key>
            <data>BwUAAA==</data>
        </dict>
        ...
    </dict>
</dict>
...
```

</details>

<details><summary><strong>Haswell PCIe AMD graphics card</strong></summary><br>

> When a supported PCIe AMD graphics card is installed it is recommended to configure the Haswell iGPU to use a connectorless framebuffer. Haswell connectorless configurations use the `iMac18,2` model identifier.

```xml
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

</details>
