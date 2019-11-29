---
layout: post
title: "Using PiHole on multiple VLANs"
categories:
  - tech
tags:
  - raspberry-pi
  - pihole
  - networking
  - vlan
---

Pi-hole has been working like a charm on my network for two years blocking ads.
I also have it configured with DNS-over-HTTPS using `cloudflared` for extra
security and privacy. Pi-hole has a great [guide to setting-up DoH].

I recently reconfigured my home network with VLANs to separate the different
kinds of devices on my network. There's my primary/private LAN with the network
gear, servers, and my personal systems. Then there's a VLAN for scary IoT stuff
and one for medium-trust devices like Xbox, PlayStation, Apple TV; devices that
can access Plex for example but nothing more.

The quick and easy solution would have been allowing the all VLANs to access
Pi-hole. For extra privacy, I don't even want the IoT or medium trust devices
knowing they're on a VLAN or that the private network exists.

My solution was to join the Pi-hole to each VLAN and then configure the DHCP
settings for each VLAN to use the Pi-hole as the DNS server.

### Editing configuration on the Pi-hole

SSH into your Pi-hole. First, edit `/etc/network/interfaces` with `sudo`

For each VLAN, add a section like the following. In this example, the VLAN ID
is `10` and I'm assigning the Pi-hole to `172.16.10.3`

```
auto eth0.10
iface eth0.10 inet static
  address 172.16.10.3/24
```

Then run `sudo ifup eth0.10` and then running `ip addr` you should see this
interface up and running with the given IP. That's it!

You can add as many of these as you like. Here's my full `interfaces` config.
The first entry is the main/primary IP and I give it the `gateway` so when
it goes to access the internet, it's doing it via the main/private LAN.

```
auto eth0
iface eth0 inet static
  address 10.65.0.3/24
  gateway 10.65.0.1

auto eth0.5
iface eth0.5 inet static
  address 10.65.5.3/24

auto eth0.7
iface eth0.7 inet static
  address 10.65.7.3/24

auto eth0.10
iface eth0.10 inet static
  address 172.16.10.3/24

auto eth0.20
iface eth0.20 inet static
  address 172.16.20.3/24

auto eth0.30
iface eth0.30 inet static
  address 172.16.30.3/24
```

### Block DNS queries to the WAN

With my DHCP settings pointing all devices to Pi-hole on all networks, the last
change I made was to my firewall to block all outbound port 53 traffic.
This prevents naughty devices from ignoring the DNS settings and talking directly
to DNS servers they have hardcoded. Chrome, Amazon Echo, smart TVs, and all
sorts of "smart" devices have been caught with hardcoded DNS.


[guide to setting-up DoH]: https://docs.pi-hole.net/guides/dns-over-https/
