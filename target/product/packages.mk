#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Required packages
PRODUCT_PACKAGES += \
    Chromium \
    ExactCalculator \
    Gboard \
    KscopeSetupWizard \
    KscopeThemesStub \
    Raindrop \
    SimpleDeviceConfig \
    ThemePicker

# Camera
ifneq ($(TARGET_USE_AOSP_CAMERA),true)
PRODUCT_PACKAGES += \
    Camera
endif

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif
