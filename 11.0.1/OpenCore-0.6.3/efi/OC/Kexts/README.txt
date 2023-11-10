USBPortInjector.kext

This codeless kext injects properties for the XHC USB ports

USB 2 Port Locations:

HS01    USB 3 Internal Header
HS02    USB 3 Internal Header
HS03    Rear Panel USB 3 Connector
HS04    Rear Panel USB 3 Connector
HS05    USB 2 Internal *
HS06    USB 2 Internal *
HS07    Rear Panel USB 2 Connector
HS08    Rear Panel USB 2 Connector
HS09    Rear Panel USB 3 Connector
HS10    Rear Panel USB 3 Connector
HS11    USB 2 Internal *
HS12    USB 2 Internal *
HS13    USB 2 Internal *
HS14    USB 2 Internal *

* either 9 pin connector or mini PCIe, untested

USB 3 Port Locations:

SS01    USB 3 Internal Header
SS02    USB 3 Internal Header
SS03    Rear Panel USB 3 Connector
SS04    Rear Panel USB 3 Connector
SS05    Rear Panel USB 3 Connector
SS06    Rear Panel USB 3 Connector

15 Port Limit

Disable the ports you aren't using by removing them from
USBPortInjector.kext/Contents/Info.plist

Example:

If you are not using the internal 2.0 ports, then
removing HS05,HS06,HS11,HS12,HS13,HS14 = 14 ports
