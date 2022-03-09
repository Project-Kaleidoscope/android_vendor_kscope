#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Environment variables for official builds.
if [ "${IS_OFFICIAL}" == "true" ]; then
    # Override host metadata.
    export BUILD_USERNAME=buildbot
    export BUILD_HOSTNAME=kscope-build

    # Set build number for releases.
    export BUILD_NUMBER=$((date +%s%N; cat /proc/sys/kernel/random/uuid; cat /proc/sys/kernel/hostname) | openssl sha1 | sed -e 's/.*=//g; s/ //g' | cut -c1-10)

    # Flatten APEXs for performance.
    export OVERRIDE_TARGET_FLATTEN_APEX=true
fi
