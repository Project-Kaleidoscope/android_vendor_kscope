#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
include vendor/kscope/target/board/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/kscope/target/board/BoardConfigQcom.mk
endif

# Soong
include vendor/kscope/target/board/BoardConfigSoong.mk
