#
# Copyright (C) 2025 The Android Open Source Project
#
#
export TARGET_ARCH="arm64-v8a"

# Build environment stuffs
export TWRP_BUILD_DEVICE="Pixel6"
export ALLOW_MISSING_DEPENDENCIES=true
export TARGET_DEVICE_ALT="Pixel6, GooglePixel6, oriole, oriole"
export TWRP_TARGET_DEVICES="Pixel6, GooglePixel6, oriole, oriole"
export BUILD_USERNAME="nobody"
export BUILD_HOSTNAME="android-build"

# Use magisk boot for patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

# We have a/b partitions
export TWRP_AB_DEVICE=1
export TWRP_VIRTUAL_AB_DEVICE=1

# Boot
export RECOVERY_AS_BOOT=1

# Screen specifications
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=0
export OF_SCREEN_H=2400
export OF_STATUS_H=120

# Device stuff
export OF_KEEP_FORCED_ENCRYPTION=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_FBE_METADATA_MOUNT_IGNORE=1
export OF_USE_LEGACY_BATTERY_SERVICES=1

# Disable decryption
export OF_SKIP_FBE_DECRYPTION=1

# Run a process after formatting data to work-around MTP issues
export OF_RUN_POST_FORMAT_PROCESS=1

