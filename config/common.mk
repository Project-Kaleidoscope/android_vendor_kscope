#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Required packages
PRODUCT_PACKAGES += \
    LatinIME \
    Launcher3QuickStep \
    ThemePicker

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Only logging privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Set GMS client ID base
ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Override undesired Google defaults
PRODUCT_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

# Version
KSCOPE_BRANCH := sunflower
KSCOPE_BUILD_TYPE := UNOFFICIAL
KSCOPE_DATE := $(shell date -u +%Y%m%d)
KSCOPE_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d '_' -f 2,3)

ifeq ($(IS_OFFICIAL), true)
    KSCOPE_BUILD_TYPE := OFFICIAL
endif

KSCOPE_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_DEVICE)-$(KSCOPE_BUILD_TYPE)-$(KSCOPE_DATE)
KSCOPE_DISPLAY_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.kscope.version=$(KSCOPE_VERSION) \
    ro.kscope.build.version=$(KSCOPE_DISPLAY_VERSION)
