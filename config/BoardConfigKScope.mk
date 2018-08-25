# Kernel
include vendor/kscope/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/kscope/config/BoardConfigQcom.mk
endif

# Soong
include vendor/kscope/config/BoardConfigSoong.mk
