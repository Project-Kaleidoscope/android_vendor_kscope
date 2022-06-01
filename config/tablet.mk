#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common tablet config.
$(call inherit-product, vendor/kscope/config/tablet_no_telephony.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/kscope/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk
