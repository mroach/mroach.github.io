---
layout: homelab
title: Ubiquiti Edgerouter X
---

# Ubiquiti Edgerouter-X

At the core of my network is the **Ubiquiti Edgerouter-X**. I bought this little
router for €52.90 in November 2017. This router is a steal at twice the price
for all the flexibility and power it offers.

## What I use it for

### Automatic VPN for Apple TV

I have an older Apple TV that has a special purpose in life: watching content
that is otherwise geo-blocked where I live. My router has a persistent VPN setup
to the United States. I then use [policy-based routing] to automatically divert
all Apple TV traffic through the VPN. This essentially puts my Apple TV in the US.
It has worked great for Netflix and streaming live TV services.

### Active Directory DNS

I have Active Directory running on my [Synology NAS]. Having specific DNS entries
on your LAN is critical to AD working at all. Fortunately with the Edgertouer it's
quite simple to sort this out. I wrote about [Active Directory DNS] and how to
solve this with the Edgerouter. It works great!

### VPN Server

I don't use it often, but on occasion when I'm away from home I might like to
access files on my NAS. I don't want it exposed to the world, so I have the
Edgerouter setup as an L2TP IPSec VPN server.


[Synology NAS]: {% link homelab/synology_ds218plus.md %}
[policy-based routing]: {% post_url 2018-03-24-ubiquiti-policy-based-routing-vpn %}
[Active Directory DNS]: {% post_url 2018-03-30-active-directory-dns-ubiquiti-edgerouter %}

