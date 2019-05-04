---
layout: homelab
title: Synology DS218+
---

# Synology DS218+ NAS

## Purchase

Purchased in December 2017 for $299.99 on Amazon.

At the same time I bought two **Western Digital Red 4 TB 5400 RPM NAS** drives at $133.99 each.

A few weeks later I added a 4GB SODIMM at a cost of €44 (RAM prices were high back then.)
This brought the total RAM up to 6 GB.


## Background

The DS218+ is my first dedicated NAS. In the past I had generic all-purpose servers
in my house with shared drives. They ran a bunch of services, usually a media server,
and shared the drives over SMB. Cheap, simple, got the job done.

These days I don't have the space for a large server, and don't want to accept
the noise and electricity consumption of them.

The DS281+ ticked some boxes for me:

* Small and quiet
* Pretty much plug and play
* Intel Celeron processor makes running Docker and virtual machines and breeze

At the time of this writing I've had it for a year and a half and I continue to be happy with it.


## What I use it for

### Plex Media Server

One of the fist things I installed was Plex Media Server. I loaded up lots of
media and started streaming. My TV, an LG OLED 55 B7 has great apps you can install.
I tried out the app from Plex but found a bunch of issues playing 4K media.
I installed a third party app called **Xplay** which works great. It's nice
being able to stream directly from my NAS to the TV without needing a box like an Apple TV.
My TV is connected via gigabit ethernet so playback is always flawless even with 4K HDR.

### Active Directory Domain Controller

I love all things enterprise, so when I saw that Synology had a package to turn
the NAS into an AD DC, I set that up straight away. I can't say I use it much though
since I spend most of my time in Linux and macOS, but my [retro machines](/retro/)
running Windows 2000 are joined to the domain. My main PC dual boots Windows 10
for playing games, and that's also joined.

Unfortunately I can't get Windows NT 4.0 to join the domain. It wasn't for lack of trying
either. Synology said this should actually work, and I spent who knows how many hours
tailing logs and reading about NTLM security levels...
At one point I actually did get it to join the domain by forcing some NetBIOS
configuration, but I could never log onto the domain. I always got errors about
the domain controller not being available. I suspect it's a NetBIOS issue caused by
Docker's internal interfaces showing up in there as PDC addresses.

At some point I may install a Windows 2000 Server instance in a virtual machine
and use that as my DC instead.

### Virtual Machines

I've got two services I'm always running on there: [Pi-hole] and a PXE boot server.

These could normally be run as Docker containers, but unfortunately it doesn't seem
possible to add additional LAN IPs to the NAS and then assign them to containers.
But when you create a VM, they can get their own LAN IPs which is necessary for
both of these services.

### Docker

For a while I had some media stuff running Docker, but I moved that to an offsite
machine in a data centre.

## Future

I love this little NAS and intend on keeping it around indefinitely. At some point
I'll probably replaces the hard drives with larger ones. Or I could see upgrading
to the DS918+ which supports NVMe SSDs for cache and has four drive bays
which makes expanding your store a lot easier since you don't have to replace
all the drives at once.

[Pi-hole]: https://pi-hole.net/
