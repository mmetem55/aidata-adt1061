#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/aidata/ADT1061
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/fix_misc.sh:recovery/root/sbin/fix_misc.sh
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
