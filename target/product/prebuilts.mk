#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Boot animation
ifneq ($(filter 360 480 720 1080 1440,$(TARGET_BOOT_ANIMATION_RES)),)
PRODUCT_COPY_FILES += \
    vendor/kscope/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
$(warning TARGET_BOOT_ANIMATION_RES is incorrect or undefined. Use generic bootanimation.)
PRODUCT_COPY_FILES += \
    vendor/kscope/bootanimation/720.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Charger
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/kscope/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)

# Sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Kaleidoscope/,$(TARGET_COPY_OUT_PRODUCT)/media/audio) \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Material/,$(TARGET_COPY_OUT_PRODUCT)/media/audio) \
    $(call find-copy-subdir-files,*,vendor/kscope/audio/Pixel/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.alarm_alert=material_gentle.ogg \
    ro.config.notification_sound=material_simple_1.ogg \
    ro.config.ringtone=Kaleidoscope_Tune.ogg
