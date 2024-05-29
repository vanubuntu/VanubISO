The Vanubuntu APT Blacklist
===========================

Some parts of this documentation page were originally written by a human and then sent to an artificial intelligence (AI) for expansion. The AI responses were carefully reviewed and edited by human editors to ensure their accuracy and clarity. This collaborative approach allowed for a more comprehensive and detailed explanation of the topic, resulting in a high-quality final product.

Snapd and Snap Store
--------------------

Ubuntu has been preinstalling the Snap Store, a package manager that has received criticism from some users, on systems. Although it still supports installing Debian packages, the Snap Store has been met with disfavor by a significant number of people. To address this issue, Vanubuntu has taken the step of blocking the snapd package, which in turn prevents the debs that have been migrated to Snaps from being installed. Vanubuntu provides alternative repositories to allow the debs to be installed. Additionally, snapd is rendered unnecessary by flatpak, as most apps available on Snap are also available as Flatpaks, and the ones that aren't are often of lower quality or solve a problem that doesn't exist.

Ubuntu Modifications
--------------------

Not only does it go against the vanubuntu philosophy, but it can also cause issues with the vanilla session. Instead, we recommend installing the Yaru theme and Ubuntu font. These will give your system a fresh and modern look, while also allowing you to set them as your default via gnome-tweaks. This approach will ensure that your system remains true to its vanilla form, while still providing a customized experience.

Bypass Restrictions
-------------------

.. DANGER::
   If a blacklisted software causes issues with your system, a full re-install may be necessary. The Vanubuntu Project does not bear responsibility for modifications made to internal system files.

Open a terminal, become root (using sudo, etc.) then CD into ``/etc/apt/preferences.d/``
and run ``rm blacklist-*.pref``. Run ``apt update``.

After removing the specified files, you will be able to install APT packages that are normally blacklisted by the base configuration or any packages that depend on them. This includes packages that are not included in the official repositories or are not recommended by the distribution maintainers. By installing these packages, you can gain access to additional features and functionality that may not be available through the standard repositories. However, please note that installing untrusted packages can be risky and may potentially cause stability issues or security vulnerabilities. It is important to only install packages from trusted sources and to carefully review the package descriptions and dependencies before installation. Additionally, it is recommended to make a backup of your system before installing any untrusted packages.
