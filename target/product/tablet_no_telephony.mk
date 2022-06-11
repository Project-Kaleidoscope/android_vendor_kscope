#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common Kaleidoscope stuff
$(call inherit-product, vendor/kscope/target/product/common.mk)

# 2-pane layout
PRODUCT_PACKAGES += \
    androidx.window.extensions
