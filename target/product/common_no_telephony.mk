#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, vendor/kscope/target/product/version.mk)
$(call inherit-product-if-exists, vendor/kscope-priv/keys/keys.mk)

# Include gms makefile
$(call inherit-product-if-exists, vendor/gms/gms.mk)

# Include overlays makefile
$(call inherit-product, vendor/kscope/overlay/overlays.mk)

# Include packages makefile
$(call inherit-product, vendor/kscope/target/product/packages.mk)

# Include prebuilts makefile
$(call inherit-product, vendor/kscope/target/product/prebuilts.mk)

# Include properties makefile
$(call inherit-product, vendor/kscope/target/product/properties.mk)
