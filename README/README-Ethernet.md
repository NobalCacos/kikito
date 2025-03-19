# Ethernet

There are 2 versions of H97N-WIFI with different ethernet hardware

| GA-H97N-WIFI   | Using     | Optionally remove from `/EFI/OC/Kexts`                |
|:---------------|:----------|:------------------------------------------------------|
| Any version    | Intel     | `RealtekRTL8111.kext` `AtherosE2200Ethernet.kext`     |
| Rev 1.0        | Atheros   | `RealtekRTL8111.kext` `IntelMausiEthernet.kext`       |
| Rev 1.1        | Realtek   | `AtherosE2200Ethernet.kext` `IntelMausiEthernet.kext` |

### Update config.plist

When removing kexts from `/EFI/OC/Kexts` also remove the corresponding `<dict>` from `/EFI/OC/config.plist`, or change `<key>Enabled</key>` from `<true/>` to `<false/>`

```xml
...
<key>Kernel</key>
<dict>
    <key>Add</key>
    <array>
        ...
        <dict>
            <key>Arch</key>
            <string>Any</string>
            <key>BundlePath</key>
            <string>RealtekRTL8111.kext</string>
            <key>Comment</key>
            <string>Realtek Ethernet</string>
            ...
            <key>Enabled</key>
            <true/>
            ...
            <key>PlistPath</key>
            <string>Contents/Info.plist</string>
        </dict>
        <dict>
            <key>Arch</key>
            <string>Any</string>
            <key>BundlePath</key>
            <string>AtherosE2200Ethernet.kext</string>
            <key>Comment</key>
            <string>Atheros Ethernet</string>
            ...
            <key>Enabled</key>
            <true/>
            ...
            <key>PlistPath</key>
            <string>Contents/Info.plist</string>
        </dict>
        <dict>
            <key>Arch</key>
            <string>Any</string>
            <key>BundlePath</key>
            <string>IntelMausiEthernet.kext</string>
            <key>Comment</key>
            <string>Intel Ethernet</string>
            ...
            <key>Enabled</key>
            <true/>
            ...
            <key>PlistPath</key>
            <string>Contents/Info.plist</string>
        </dict>
        ...
    </array>
    ...
</dict>
...
```
