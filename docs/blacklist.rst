Snap Store and Ubuntu Modifications
===================================

Vanubuntu has been explicitly set up to prevent the installation of Snapd and
the original Ubuntu Desktop.

Snapd and Snap Store
--------------------

Now this is a bit complicated. So Ubuntu has been installing the Snap Store,
one of the most hated package managers, onto systems as a preinstalled program.
Even though it still supports installing Debian packages, it is still disliked
by a bunch of people.

So Vanubuntu has solved this by blocking the snapd package. This also prevents
the debs migrated to Snaps from being installed. Vanubuntu comes with alternative
repos to allow the debs to be installed.

Also, snapd is rendered pointless by flatpak. Most of the apps available on Snap
are also available as Flatpaks, the ones that aren't are usually cheaply made or
solve a problem that never existed.

Ubuntu Modifications
--------------------

This refers to the ubuntu-desktop package.

This is against the whole purpose of vanubuntu, and can also ruin the vanilla session
in a few ways.

Instead of using this, install the Yaru theme and Ubuntu font. Then you can set both of
those to be your default via gnome-tweaks.

Bypass Restrictions
-------------------

.. DANGER::
   If one of the normally blacklisted software breaks your system, you will have to do
   a full re-install. The Vanubuntu Project is not responsible for the mods you perform
   on the internal files of your system.

Open a terminal, then CD into ``/etc/apt/preferences.d/`` and run ``rm blacklist-*.pref``.

You will then be able to install blacklisted packages or any packages that depend on them.
