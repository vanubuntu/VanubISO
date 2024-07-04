The Vanubuntu APT Blacklist
===========================

Snapd and Snap Store
--------------------

The lack of Snap is complicated. The snap store is still propietary and is only controlled by the one and only Canonical Ltd, which is a bit sneaky on its Ubuntu system, as it essentially tries to get people to fall into the snap ecosystem, and that plan failed. Also, it is essentially rendered useless since most of the apps it offers are already available in either Debian or Flatpak form, and most of the apps that aren't available outside the Snap Store are poorly made in a way or two.

Ubuntu Modifications
--------------------

ubuntu-desktop goes against the Vanubuntu philosophy. If you want to replicate something like ubuntu-desktop you're gonna have to install the Yaru theme as well as Dash to Dock and Desktop Icons NG.

Bypass Restrictions
-------------------

.. DANGER::
   If a blacklisted software causes issues with your system, a full re-install may be necessary. The Vanubuntu Project does not bear responsibility for modifications made to internal system files.

Open a terminal, become root (using sudo, etc.) then CD into ``/etc/apt/preferences.d/``
and run ``rm blacklist-*.pref``. Run ``apt update``.

After removing these files, you will be able to install APT packages that are normally blacklisted by the base configuration or any packages that depend on them.
