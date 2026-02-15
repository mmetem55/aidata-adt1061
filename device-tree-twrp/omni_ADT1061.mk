#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from ADT1061 device
$(call inherit-product, device/aidata/ADT1061/device.mk)

PRODUCT_DEVICE := ADT1061
PRODUCT_NAME := omni_ADT1061
PRODUCT_BRAND := AIDATA
PRODUCT_MODEL := ADT1061
PRODUCT_MANUFACTURER := aidata

PRODUCT_GMS_CLIENTID_BASE := android-elink

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ums512_1h10_Natv-user 10 QP1A.190711.020 2849 release-keys"

BUILD_FINGERPRINT := AIDATA/ADT1061/ADT1061:10/QP1A.190711.020/2849:user/release-keys

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/focaltech-FT5x46.bin:recovery/root/vendor/firmware/focaltech-FT5x46.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/novatek_ts_fw.bin:recovery/root/vendor/firmware/novatek_ts_fw.bin
