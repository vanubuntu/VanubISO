# change this value to the latest ubuntu version details for an upgrade
# due to compatibility reasons we are using jammy script
# when 24.04 comes out we will use it
# if we can move to a custom runner we can follow the latest update cycle
export VANUBUNTU_VERSION_CODE="jammy"
export VANUBUNTU_VERSION="22.04"

# is this version in development?
# 0: no
# 1: yes
#
# ALWAYS SET 1 IF THE ORIGINAL UBUNTU VERSION HAS STILL NOT ENTERED
# STABLE!
export VANUBUNTU_VERSION_DEV=1
