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

## Building

Non-Debian based distros will probably not offer debootstrap, which is required
for VanubISO to work. This means you'll probably want to build the distro
on Debian or Ubuntu.

Run `vanubuntu.sh` to run the build.
