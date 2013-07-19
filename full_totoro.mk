# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit products
$(call inherit-product, device/samsung/bcm21553-common/common.mk)
$(call inherit-product, vendor/samsung/totoro/totoro-vendor.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# This is where we'd set a backup provider if we had one
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/totoro/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/mdpi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Add LDPI assets, in addition to MDPI
    PRODUCT_LOCALES += ldpi

# Kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/totoro/prebuilt/root/fsr.ko:root/fsr.ko \
    device/samsung/totoro/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/totoro/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/totoro/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/totoro/prebuilt/root/j4fs.ko:root/j4fs.ko \
    device/samsung/totoro/prebuilt/root/sec_param.ko:root/sec_param.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/totoro/ramdisk/init.rc:root/init.rc \
    device/samsung/totoro/ramdisk/init.bcm21553.rc:root/init.bcm21553.rc

# Prebuilt Kernel - DELETE from the package
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/totoro/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
