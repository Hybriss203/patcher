#!/bin/sh

# Apply these patches before compilation:
PATCHES=$PWD/patcher/patches

# Clean up first
git -C build				clean -dfqx
git -C build				reset -q --hard
git -C frameworks/av			clean -dfqx
git -C frameworks/av			reset -q --hard
git -C frameworks/base			clean -dfqx
git -C frameworks/base			reset -q --hard
git -C frameworks/native		clean -dfqx
git -C frameworks/native		reset -q --hard
git -C packages/apps/Gallery2		clean -dfqx
git -C packages/apps/Gallery2		reset -q --hard
git -C packages/apps/LockClock		clean -dfqx
git -C packages/apps/LockClock		reset -q --hard
git -C packages/apps/Settings		clean -dfqx
git -C packages/apps/Settings		reset -q --hard
git -C system/core			clean -dfqx
git -C system/core			reset -q --hard
git -C vendor/cm			clean -dfqx
git -C vendor/cm			reset -q --hard

### Patches
git -C build				apply $PATCHES/build0.patch
git -C frameworks/av			apply $PATCHES/frameworks-av0.patch
git -C frameworks/av			apply $PATCHES/frameworks-av1.patch
git -C frameworks/base			apply $PATCHES/frameworks-base0.patch
git -C frameworks/base			apply $PATCHES/frameworks-base1.patch
git -C frameworks/base			apply $PATCHES/frameworks-base2.patch
git -C frameworks/base			apply $PATCHES/frameworks-base3.patch
git -C frameworks/base			apply $PATCHES/frameworks-base4.patch
git -C frameworks/native		apply $PATCHES/frameworks-native0.patch
git -C packages/apps/Gallery2		apply $PATCHES/packages-apps-Gallery20.patch
git -C packages/apps/Gallery2		apply $PATCHES/packages-apps-Gallery21.patch
git -C packages/apps/Gallery2		apply $PATCHES/packages-apps-Gallery22.patch
git -C packages/apps/LockClock		apply $PATCHES/packages-apps-LockClock0.patch
git -C packages/apps/Settings		apply $PATCHES/packages-apps-Settings0.patch
git -C system/core			apply $PATCHES/system-core0.patch
git -C system/core			apply $PATCHES/system-core1.patch
git -C system/core			apply $PATCHES/system-core2.patch
git -C vendor/rr			apply $PATCHES/vendor-cm0.patch
git -C vendor/rr			apply $PATCHES/vendor-cm1.patch
