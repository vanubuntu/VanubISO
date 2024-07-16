Building Vanubuntu
==================

Vanubuntu is a largely complex project, as with every other Ubuntu flavour.
There are several files which typically are just optimizations to prevent
bugs.

.. NOTE::
   If you are looking for daily builds, see `GitHub Actions <https://github.com/vanubuntu/VanubISO/actions>`_.

Configuration
-------------

VanubISO is controlled by a file called ``vanub-env-vars.sh``. This file
is hard to edit so we recommend that you just simply use the so-called
``vanubuntu-tui.sh`` script.

Note that you shouldn't push modified ``vanub-env-vars.sh`` scripts made
with this tool.

Building
--------

Run ``vanubuntu.sh`` to build the system ISO. It takes around 10 minutes to
complete the build.
