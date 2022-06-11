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
    KscopeSystemUIOverlay \
    KscopeThemePickerOverlay

PRODUCT_PACKAGES += \
    KeyboardNoNavigationBarOverlay \
    Launcher3NoHintOverlay \
    NavigationBarMode2ButtonOverlay \
    NavigationBarNoHintOverlay
