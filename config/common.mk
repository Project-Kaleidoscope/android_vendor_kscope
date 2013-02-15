#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/kscope/overlay/common

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/kscope/overlay/common

# Required packages
PRODUCT_PACKAGES += \
    Chromium \
    Gboard \
    SimpleDeviceConfig \
    ThemePicker

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/kscope/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/kscope/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/kscope/prebuilt/bin/50-kscope.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-kscope.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/kscope/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/kscope/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/kscope/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Only logging privapp-permissions whitelist
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1

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

-include vendor/gms/common/common-vendor.mk
-include vendor/kscope-priv/keys/keys.mk

KSCOPE_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_DEVICE)-$(KSCOPE_DATE)-$(KSCOPE_BUILD_TYPE)
KSCOPE_DISPLAY_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.kscope.branch=$(KSCOPE_BRANCH) \
    ro.kscope.version=$(KSCOPE_VERSION) \
    ro.kscope.build.version=$(KSCOPE_DISPLAY_VERSION)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true
