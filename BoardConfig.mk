#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/LH8n

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH                := arm64
TARGET_ARCH_VARIANT        := armv8-a
TARGET_CPU_ABI             := arm64-v8a
TARGET_CPU_ABI2            := 
TARGET_CPU_VARIANT         := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH                := arm
TARGET_2ND_ARCH_VARIANT        := armv7-a-neon
TARGET_2ND_CPU_ABI             := armeabi-v7a
TARGET_2ND_CPU_ABI2            := armeabi
TARGET_2ND_CPU_VARIANT         := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := TECNO-LH8n

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := LH8n
TARGET_NO_BOOTLOADER         := true
TARGET_USES_UEFI             := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Kernel
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NO_KERNEL      := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE    := 0x40078000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_PAGE_SIZE      := 4096
BOARD_KERNEL_OFFSET  := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET    := 0x07c08000
BOARD_DTB_OFFSET     := 0x07c08000

BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# DTB - prebuilt
TARGET_PREBUILT_DTB  := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Build Rules
BUILD_BROKEN_DUP_RULES                       := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD    := true

# Hardware
BOARD_USES_MTK_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE                        := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE                := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE         := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_HAS_LARGE_FILESYSTEM                    := true
BOARD_SUPER_PARTITION_SIZE                    := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS                  := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext vendor_dlkm odm_dlkm
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE           := 9122611200 # TODO: Fix hardcoded value

# Partitions - file type
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE     := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE    := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4              := true
TARGET_USERIMAGES_USE_F2FS              := true

TARGET_COPY_OUT_ODM_DLKM                := odm_dlkm
TARGET_COPY_OUT_PRODUCT                 := product
TARGET_COPY_OUT_SYSTEM                  := system
TARGET_COPY_OUT_SYSTEM_EXT              := system_ext
TARGET_COPY_OUT_VENDOR                  := vendor
TARGET_COPY_OUT_VENDOR_DLKM             := vendor_dlkm

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Recovery
TARGET_NO_RECOVERY              := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_HAS_NO_SELECT_BUTTON      := true
TARGET_RECOVERY_PIXEL_FORMAT    := RGBX_8888
BOARD_SUPPRESS_SECURE_ERASE     := true
TARGET_RECOVERY_FSTAB           := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Treble
BOARD_VNDK_VERSION := current

# Crypto
TW_INCLUDE_CRYPTO               := true
TW_INCLUDE_CRYPTO_FBE           := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION   := true
TW_USE_FSCRYPT_POLICY           := 2
TW_FORCE_KEYMASTER_VER          := true
TW_PREPARE_DATA_MEDIA_EARLY     := true

PLATFORM_VERSION                := 14
PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH         := 2099-12-31
VENDOR_SECURITY_PATCH           := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH             := $(PLATFORM_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ENABLE                           := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS           += --flags 3
BOARD_AVB_ROLLBACK_INDEX                   := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM               := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH                := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX          := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Screen
TARGET_SCREEN_WIDTH   := 1080
TARGET_SCREEN_HEIGHT  := 2460
TARGET_SCREEN_DENSITY := 480

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES            := true
TW_INPUT_BLACKLIST            := "hbtp_vm"
TW_USE_TOOLBOX                := true
TW_NO_FLASH_CURRENT_TWRP      := true

TW_FRAMERATE := 60
TW_BRIGHTNESS_PATH    := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS     := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_NO_SCREEN_BLANK    := true

TW_INCLUDE_FB2PNG       := true
TW_INCLUDE_NTFS_3G      := true
TW_INCLUDE_REPACKTOOLS  := true
TW_INCLUDE_RESETPROP    := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP    := true
TW_INCLUDE_LPTOOLS      := true
TW_INCLUDE_FUSE_EXFAT   := true
TW_INCLUDE_FUSE_NTFS    := true

TW_EXCLUDE_LPDUMP      := true
TW_EXCLUDE_APEX        := true

TW_HAS_NO_RECOVERY_PARTITION := true
TW_BACKUP_EXCLUSIONS         := /data/fonts

TARGET_USES_MKE2FS := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS     := "300"
TW_CUSTOM_CLOCK_POS   := "70"
TW_CUSTOM_BATTERY_POS := "790"

# FastbootD
TW_INCLUDE_FASTBOOTD := true

# USB Configuration
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_HAS_MTP := true

# USB OTG
TW_USB_STORAGE := true

# Support /data/media
RECOVERY_SDCARD_ON_DATA := true

# Vendor Boot
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE     := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_LH8n
TARGET_RECOVERY_DEVICE_MODULES := libinit_LH8n

# Vendor Modules
TW_LOAD_VENDOR_MODULES             := true
TW_LOAD_VENDOR_BOOT_MODULES        := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# Version
TW_DEVICE_VERSION := naze | LH8n

#SHRP Prop

# NOTE - Dont use '-' or blank spaces in flag values , otherwise it will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC). 
# Path of your SHRP Tree
SHRP_PATH := device/tecno/LH8n

# Maintainer name *
SHRP_MAINTAINER := naze

# Device codename *
SHRP_DEVICE_CODE := LH8n

# Recovery Type (It can be treble,normal,SAR) [Only for About Section] *
SHRP_REC_TYPE := Treble

# Recovery Type (It can be A/B or A_only) [Only for About Section] *
SHRP_DEVICE_TYPE := A/B
# SHRP Padding Flag (Only for rounded corner devices.) [Optional]
# You have to change these values according to your device's roundness.
SHRP_STATUSBAR_RIGHT_PADDING := 40
SHRP_STATUSBAR_LEFT_PADDING := 40

# For Notch devices [Optional]
SHRP_NOTCH := true

# put this 0 if device has no EDL mode *
SHRP_EDL_MODE := 0

# Put your device's paths from fstab *
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg

# Use this flag only if your device is A/B *
SHRP_AB := true

# Check your device's recovery path, dont use blindly
SHRP_REC := no_recovery_partition 

# Put 0 to disable flashlight
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/torch/torch/torch_level
SHRP_FONP_2 := /sys/class/sub_torch/sub_torch/sub_torch_level
SHRP_FONP_3 := /sys/class/flashlight_core/flashlight/flashlight_torch

# Default (if not set) will use /system if SHRP_EXPRESS true otherwise will use legacy method of patching
SHRP_EXPRESS_USE_DATA := true