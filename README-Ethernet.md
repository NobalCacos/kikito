# Ethernet

There are 2 versions of H97N-WIFI with different hardware.

## GA-H97N-WIFI (rev. 1.0)

Rev. 1.0 has

- Intel GbE Ethernet
- Atheros GbE Ethernet

### Using Intel

Optionally remove from `/EFI/OC/Kexts`:

- `RealtekRTL8111.kext`
- `AtherosE2200Ethernet.kext`

### Using Atheros

Optionally remove from `/EFI/OC/Kexts`:

- `RealtekRTL8111.kext`
- `IntelMausiEthernet.kext`

## GA-H97N-WIFI (rev. 1.1)

Rev. 1.1 has

- Intel GbE Ethernet
- Realtek GbE Ethernet

### Using Intel

Optionally remove from `/EFI/OC/Kexts`:

- `AtherosE2200Ethernet.kext`
- `RealtekRTL8111.kext`

### Using Realtek

Optionally remove from `/EFI/OC/Kexts`:

- `AtherosE2200Ethernet.kext`
- `IntelMausiEthernet.kext`

## Updating config.plist

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
			<string>x86_64</string>
			<key>BundlePath</key>
			<string>RealtekRTL8111.kext</string>
			<key>Comment</key>
			<string>Realtek Ethernet</string>
			<key>Enabled</key>
			<true/>
			<key>ExecutablePath</key>
			<string>Contents/MacOS/RealtekRTL8111</string>
			<key>MaxKernel</key>
			<string></string>
			<key>MinKernel</key>
			<string>12.0.0</string>
			<key>PlistPath</key>
			<string>Contents/Info.plist</string>
		</dict>
		<dict>
			<key>Arch</key>
			<string>x86_64</string>
			<key>BundlePath</key>
			<string>AtherosE2200Ethernet.kext</string>
			<key>Comment</key>
			<string>Atheros Ethernet</string>
			<key>Enabled</key>
			<true/>
			<key>ExecutablePath</key>
			<string>Contents/MacOS/AtherosE2200Ethernet</string>
			<key>MaxKernel</key>
			<string></string>
			<key>MinKernel</key>
			<string>12.0.0</string>
			<key>PlistPath</key>
			<string>Contents/Info.plist</string>
		</dict>
		<dict>
			<key>Arch</key>
			<string>x86_64</string>
			<key>BundlePath</key>
			<string>IntelMausiEthernet.kext</string>
			<key>Comment</key>
			<string>Intel Ethernet</string>
			<key>Enabled</key>
			<true/>
			<key>ExecutablePath</key>
			<string>Contents/MacOS/IntelMausiEthernet</string>
			<key>MaxKernel</key>
			<string></string>
			<key>MinKernel</key>
			<string>12.0.0</string>
			<key>PlistPath</key>
			<string>Contents/Info.plist</string>
		</dict>
		...
	</array>
	...
</dict>
...
```
