# Vanubuntu ISO

This repository contains the `vanubISO` command line tool to build Vanubuntu from an
Ubuntu temporary chroot. It also contains some patches to original Ubuntu code
that makes Vanubuntu work properly, preventing any bug rendering.

For more info see [the docs](https://vanubuntu.github.io/VanubISO/).

## What is Vanubuntu?

Vanubuntu is a Ubuntu-based distribution that features a mostly vanilla
GNOME experience. It only has a few user-friendliness modifications.

Our goal is to make a 99% vanilla GNOME experience. If this project goes very
well and if it gets popular enough, we could end up being allowed into the ubuntu
flavours website.

## Download Builds

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/vanubuntu/vanubISO/daily.yml?style=for-the-badge&logo=ubuntu&label=daily%20builds)](https://github.com/vanubuntu/VanubISO/actions/workflows/daily.yml)

Live images are built every day at 12:00 UTC and can be found
by clicking the userbar above.
You can also build your own images, see below.

## Building

Non-Debian based distros will probably not offer debootstrap, which is required
for VanubISO to work. This means you'll probably want to build the distro
on Debian or Ubuntu.

WSL has not been tested, you may need to enable wsl's systemd for it to work.

### Basic Build

Run `bash ./vanubuntu.sh` as root to run the build.

> **Note:**<br>You can also pass the `flatpak` and/or `gsconnect` arguments to install the respective packages.

Building takes around 5 minutes, depending on what packages you select.
The result is a Live ISO image that lets you install or test the Vanubuntu
system that was built on the ISO.

Please note, you need `schroot` and `debootstrap` for vanubISO to build any images.

### Change Configuration

This tool only works if you have the `whiptail` package installed.

Run `bash ./vanubuntu-tui.sh` as root to open a menu, where you can change the environment
variables that control the ISO.

You can either run a single Basic Build with these settings, or save these settings to use
with future builds you perform.

Do not push any changes made via this tool, else it will apply those changes to official
daily builds performed by github.
