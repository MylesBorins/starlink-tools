# Starlink tools
> Trying to make it work

## Unifi

There is a weird unifi bug. When there is a power cycle with the Starlink Unifi assigns a local IP and that makes me a sad panda. This can be quickly fixed with a DHCP reset... but this needs to be automated.

1. place `./unifi/reset-dhcp.sh` in `/config/scripts` on the Unifi Secure Gateway
2. place `./unifi/config.gateway.json` in `/usr/lib/unifi/data/sites/default` on the Unifi Cloud Key
3. Force a provision of the USG from the config panel
