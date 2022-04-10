#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/kscope/overlay/RaiseNOW

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/kscope/overlay/RaiseNOW

PRODUCT_PACKAGES += \
    KscopeFrameworksOverlay \
    KscopeLauncher3Overlay \
    KscopeNetworkStackOverlay \
    KscopeSettingsOverlay \
    KscopeSettingsProviderOverlay \
    KscopeSimpleDeviceConfigOverlay \
    KscopeSystemUIOverlay

PRODUCT_PACKAGES += \
    Launcher3NoHintOverlay \
    NavigationBarMode2ButtonOverlay \
    NavigationBarNoHintOverlay

# Required packages
PRODUCT_PACKAGES += \
    Chromium \
    ExactCalculator \
    Gboard \
    KscopeSetupWizard \
    SimpleDeviceConfig \
    ThemePicker

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Kaleidoscope/,$(TARGET_COPY_OUT_PRODUCT)/media/audio) \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Material/,$(TARGET_COPY_OUT_PRODUCT)/media/audio) \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Pixel/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.alarm_alert=material_gentle.ogg \
    ro.config.notification_sound=material_simple_1.ogg \
    ro.config.ringtone=Kaleidoscope_Tune.ogg

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
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

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

# Boot animation
ifneq ($(filter 360 480 720 1080 1440,$(TARGET_BOOT_ANIMATION_RES)),)
PRODUCT_COPY_FILES += \
    vendor/kscope/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
$(warning TARGET_BOOT_ANIMATION_RES is incorrect or undefined. Use generic bootanimation.)
PRODUCT_COPY_FILES += \
    vendor/kscope/bootanimation/720.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Version
KSCOPE_BRANCH := sunflowerleaf
KSCOPE_BUILD_TYPE := UNOFFICIAL
KSCOPE_DATE := $(shell date -u +%Y%m%d)
KSCOPE_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d '_' -f 2,3)

ifeq ($(IS_OFFICIAL), true)
    KSCOPE_BUILD_TYPE := OFFICIAL
endif

-include vendor/gms/gms.mk
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
