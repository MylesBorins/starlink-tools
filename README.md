# Starlink tools
> Trying to make it work

## Unifi

### TL;DR

1. place `./unifi/reset-dhcp.sh` in `/config/scripts` on the Unifi Secure Gateway
1. place `./unifi/config.gateway.json` in `/usr/lib/unifi/data/sites/default` on the Unifi Cloud Key
1. Force a provision of the USG from the config panel

### DHCP loop fix via cron

There is a weird unifi bug. When there is a power cycle with the Starlink Unifi assigns a local IP and that makes me a sad panda. This can be quickly fixed with a DHCP reset... but this needs to be automated.

The `reset-dhcp.sh` is run by cron everysecond to check if DHCP needs to be reset.

There is probably a better way to do this via dissallowing the few IPs the dish will
serve that are incorrect but shurgs.

Include `./unifi/dhcp-fix.config.gateway.json` in your `config.gateway.json`.

### WHERE THE STATS?

Borrowed from [UI Community Forum](https://community.ui.com/questions/Starlink-USG-Pro-4-Failover-and-Static-Routes-not-being-honored/29875219-0057-4eed-b85c-704d58cae9f2#answer/db771f1e-155b-4b9f-84a6-87e6e9dfcde0)

Thanks Marc7654.

You need a NAT rule to forwad traffic

Include `./unifi/stats.config.gateway.json` in your `config.gateway.json`.

### 4G Fallback on cutstom network

From [this awesome reddit thread](https://www.reddit.com/r/Starlink/comments/lrnku7/how_to_configure_starlink_with_vlan_and_dedicated/).

I am using a 4G modem plugged into WAN2. I created a 4G WAN and 4G LAN following the steps in the above reddit thread.

Include `./unifi/dual-wan.config.gateway.json` in your `config.gateway.json`.
