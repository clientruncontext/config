i use nix too, btw :D

1. install base nixos using the commandline or through the graphical installer

- without ui and bloat
- with this disk config

```
/dev/nvme0n1p1 - 1G fat32 fmask=0022 dmask=0022 vfat
                 mounts to /boot

/dev/nvme0n1p5 - 100% btrfs
                 subvol root -> /
                 subvol home -> /home
                 subvol root -> /root

# or in simpler steps:
# (dont do this if you are dualbooting) create the EFI partition which is mounted to boot, fmask is 0022, dmask is 0022 and the filesystem is vfat or fat32
# create another partition that takes up all the unallocated storage, has btrfs as its filesystem (for the nixos install)
# create subvolumes (for /dev/nvme0n1p5) root and home, where root is mounted to `/` and home is mounted to `/home`
```

2. create user named 'clientruncontext'

3. run this

```bash
cd ~
nix-shell -p git
```

4. run this inside nix shell

```bash
git clone https://github.com/clientruncontext/config
cd config
sudo nixos-rebuild switch --flake .#fix_nixpkgs --impure
sudo nixos-rebuild switch --flake .#default --impure
```

5. reboot and run this

```bash
mkdir -p /home/clientruncontext/Pictures/Screenshots
mkdir -p /home/clientruncontext/Downloads
mkdir -p /home/clientruncontext/Desktop
mkdir -p /home/clientruncontext/Documents
mkdir -p /home/clientruncontext/Projects
```

6. add to `/etc/resolv.conf` as root

```
nameserver 1.1.1.1
```

7. disable `networking.resolvconf.enable = true;` to prevent isp spying

8. install roblox
   
9. copy asset overlay content folder to `~/.var/app/org.vinegarhq.Sober/data/sober/asset_overlay`

10. do any additional configurations

11. done
