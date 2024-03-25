## USBPortInjector.kext

This codeless kext injects the port map and power properties for the XHC on our H97N-WIFI.

```Info.plist``` will require edits and should have:
* no more than **15** ports in the ```ports``` dictionary
* a ```model``` that matches ```PlatformInfo```&#8594;```SystemProductName```  in the OC config.plist e.g. ```iMac15,1```
* a ```port-count``` that corresponds not to the total number of ports, but to the highest ```port``` address value present in in the ```ports``` dictionary e.g. ```0x15000000``` or ```FQAAAA==```

### Port Physical Locations

#### USB 2

| Port | Location                   |
|:-----|:---------------------------|
| HS01 | USB 3 Internal Header      |
| HS02 | USB 3 Internal Header      |
| HS03 | Rear Panel USB 3 Connector |
| HS04 | Rear Panel USB 3 Connector |
| HS05 | USB 2 Internal Header      |
| HS06 | USB 2 Internal Header      |
| HS07 | Rear Panel USB 2 Connector |
| HS08 | Rear Panel USB 2 Connector |
| HS09 | Rear Panel USB 3 Connector |
| HS10 | Rear Panel USB 3 Connector |
| HS11 | Mini PCI Express           |

#### USB 3

| Port | Location                   |
|:-----|:---------------------------|
| SS01 | USB 3 Internal Header      |
| SS02 | USB 3 Internal Header      |
| SS03 | Rear Panel USB 3 Connector |
| SS04 | Rear Panel USB 3 Connector |
| SS05 | Rear Panel USB 3 Connector |
| SS06 | Rear Panel USB 3 Connector |

### Back Panel USB Layout

by [grumat](https://github.com/grumat)

```
 -------------------------------------------------------------------------
|  ------                                 __--__    __--__     ..     ..  |
| | HS07 |    .-.     .-.                | LAN2 |  | LAN1 |   (Or)   (LI) |
| |======|   (SMA)   (SMA)               | .... |  | .... |    ˜˜     ˜˜  |
| | HS08 |    ˜-˜     ˜-˜     ________    ======    ======     ..     ..  |
|  ------                     \=HDMI=/    ------    ------    (Bk)   (LO) |
|    --     ---------------     ˜˜˜˜     | SS04 |  | SS06 |    ˜˜     ˜˜  |
|  / PS \  | ######### ### |  ________   |======|  |======|  |˜˜˜˜|   ..  |
|  \ /2 /  | ######### ### |  \=HDMI=/   | SS03 |  | SS05 |  |TosL|  (Mi) |
|    --     \-------------/     ˜˜˜˜      ------    ------    ----    ˜˜  |
 -------------------------------------------------------------------------
 ```

## 15 Port Limit

Disable the ports you aren't using by removing them from USBPortInjector.kext/Contents/Info.plist

**Example:** If you are not using the internal 2.0 ports, then removing HS05, HS06 = 15 ports

