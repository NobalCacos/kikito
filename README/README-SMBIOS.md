# SMBIOS

<details><summary><strong>What's this?</strong></summary>

OpenCore will generate a complete [SMBIOS](https://en.wikipedia.org/wiki/System_Management_BIOS) for your system according to information provided in the `PlatformInfo` section of `config.plist` and a dataset derived from Apple firmwares. `GenSMBIOS` is a python script that uses acidanthera's `macserial` to generate required serials and unique identifiers.

</details>

<details><summary>The model identifier used to generate serials should match <code>SystemProductName</code> in the <code>PlatformInfo</code> section of your <code>config.plist</code></summary><br>

```xml
...
<key>PlatformInfo</key>
<dict>
    ...
    <key>Generic</key>
    <dict>
        ...
        <key>SystemProductName</key>
        <string>iMac18,2</string>
        ...
    </dict>
    ...
</dict>
...
````

</details><br>

| Model Identifier | Graphics Configuration         |
|:-----------------|:-------------------------------|
| iMac18,2         | Haswell PCIe AMD graphics card |
| iMac18,1         | Haswell HD Graphics            |
| iMac16,2         | Broadwell                      |

## Download GenSMBIOS

[github.com/corpnewt/GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

## Update config.plist

Edit the `PlatformInfo` section of your `config.plist` so that the `MLB`, `ROM`, `SystemSerialNumber` and `SystemUUID` values are unique to your machine.

```xml
...
<key>PlatformInfo</key>
<dict>
    ...
    <key>Generic</key>
    <dict>.
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
```

| PlatformInfo &#8594; Generic | Source                    |
|:-----------------------------|--------------------------:|
| MLB                          | \**Board Serial*          |
| ROM                          | \**Apple ROM*             |
| SystemSerialNumber           | \**Serial*                |
| SystemUUID                   | \**SmUUID*                |

\* *GenSMBIOS output*
