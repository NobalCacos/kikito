# SMBIOS

## GenSMBIOS script

> GenSMBIOS is a python script that uses acidanthera's `macserial` to generate SMBIOS and optionally saves them to a plist

The model identifier used to generate serials should match `SystemProductName` in the `PlatformInfo` section of your `config.plist`

| Model Identifier  | Graphics Configuration |
|:------------------|:-----------------------|
| iMac18,2          | PCIe graphics card     |
| iMac18,1          | Haswell HD Graphics    |
| iMac16,2          | Broadwell Iris Pro     |

GenSMBIOS: [github.com/corpnewt/GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

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
