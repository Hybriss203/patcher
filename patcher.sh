#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
CUSTOM=$PATCHER_PATH/patches

APN_LIST_URL=https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-13.0/prebuilt/common/etc/apns-conf.xml

# Clean up first
cd $ROM_TREE/bionic
git clean -f -d && git reset --hard
cd $ROM_TREE/bootable/recovery
git clean -f -d && git reset --hard
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/external/boringssl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libavc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libhevc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libmpeg2
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnfc-nci
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libopus
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libvpx
git clean -f -d && git reset --hard
cd $ROM_TREE/external/skia
git clean -f -d && git reset --hard
cd $ROM_TREE/external/sonivox
git clean -f -d && git reset --hard
cd $ROM_TREE/external/tremolo
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/ex
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/net/wifi
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/libhardware
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Bluetooth
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/CertInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/PackageInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/UnifiedEmail
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cmsdk
git clean -f -d && git reset --hard

cd $ROM_TREE

### Custom patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build1.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base4.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base5.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base6.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-native0.patch
patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-LockClock0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings2.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings3.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core2.patch

# Get APN list from nightly branch and apply patch on top
curl -s $APN_LIST_URL > vendor/cm/prebuilt/common/etc/apns-conf.xml
