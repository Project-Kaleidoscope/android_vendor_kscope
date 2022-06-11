#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Version
KSCOPE_BRANCH := sunflowerleaf
KSCOPE_BUILD_TYPE := UNOFFICIAL
KSCOPE_DATE := $(shell date -u +%Y%m%d)
KSCOPE_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d '_' -f 2,3)

ifeq ($(IS_OFFICIAL), true)
    KSCOPE_BUILD_TYPE := OFFICIAL
endif

KSCOPE_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_DEVICE)-$(KSCOPE_DATE)-$(KSCOPE_BUILD_TYPE)
KSCOPE_DISPLAY_VERSION := Kaleidoscope-$(KSCOPE_BRANCH)-$(KSCOPE_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.kscope.branch=$(KSCOPE_BRANCH) \
    ro.kscope.version=$(KSCOPE_VERSION) \
    ro.kscope.build.version=$(KSCOPE_DISPLAY_VERSION)
