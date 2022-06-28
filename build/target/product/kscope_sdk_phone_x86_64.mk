#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdk_phone_x86_64 device.
$(call inherit-product, build/target/product/sdk_phone_x86_64.mk)

# Inherit some common Kaleidoscope stuff.
$(call inherit-product, vendor/kscope/target/product/common_no_telephony.mk)

# Enable mainline checking.
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/media/bootanimation.zip

# Overrides
PRODUCT_NAME := kscope_sdk_phone_x86_64
PRODUCT_MODEL := Kaleidoscope SDK built for x86_64

# Disable face unlock functionality.
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
TARGET_FACE_UNLOCK_SUPPORTED := false
