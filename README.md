# Vanubuntu ISO

This repository contains the `vanubISO` command line tool to build Vanubuntu from an
Ubuntu temporary chroot. It also contains some patches to original Ubuntu code
that makes Vanubuntu work properly, preventing any bug rendering.

## Why does this exist?

Historically, Vanubuntu's codebase was based off that of Ubuntu-Cinnamon-Remix, but
that version of Vanubuntu is deprecated, and was replaced with this one, for these
reasons:
* It's hard to find UCR's scripts. Vanubuntu devs couldn't even find them.
* If we did succeed in finding UCR's scripts, we wouldn't have been able to fully
  erase the Cinnamon desktop enviornment from them, unless we knew the name of
  every app and package meant for Cinnamon as well as Linux Mint.
* Vanubuntu updates are slower when forking an existing mod of Ubuntu.
  Independent development of Vanubuntu scripts make the updating faster.
* UCR is still configured for an unsupported version of Ubuntu (18.04).

Our goal is to make a 99% vanilla GNOME experience. If this project goes very
well and if it gets popular enough, we could end up being allowed into the ubuntu
flavours website.

## Download Builds

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/vanubuntu/vanubISO/daily.yml?style=plastic&logo=ubuntu&label=daily%20builds)

Live images are built every day at 12:00 UTC and can be found
[here](https://github.com/vanubuntu/VanubISO/actions/workflows/daily.yml).
You can also build your own images, see below.

## Building

Non-Debian based distros will probably not offer debootstrap, which is required
for VanubISO to work. This means you'll probably want to build the distro
on Debian or Ubuntu.

WSL has not been tested, you may need to enable wsl's systemd for it to work.

### Basic Build

Run `bash ./vanubuntu.sh` as root to run the build.
You can also pass the "flatpak" and/or "gsconnect" arguments to install the
respective packages.

Building takes around 5 minutes, depending on what packages you select.
The result is a Live ISO image that lets you install or test the Vanubuntu
system that was built on the ISO.

Please note, you need `schroot` and `debootstrap` for vanubISO to build any images.
Anyways, you don't have to install these manually, you can just run the script and
it will install its dependencies itself.

### Change Configuration

Run `bash ./vanubuntu-tui.sh` as root to open a menu, where you can change the environment
variables that control the ISO.

You can either run a single Basic Build with these settings, or save these settings to use
with future builds you perform.

Do not push any changes made via this tool, else it will apply those changes to official
daily builds performed by github.
