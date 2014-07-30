# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/zte/warplte/include


TARGET_NO_BOOTLOADER := true
TARGET_NO_INITLOGO := true

# Kernel
TARGET_KERNEL_CONFIG := w4g_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
BOARD_KERNEL_CMDLINE := := androidboot.hardware=qcom user_debug=31 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/zte
#TARGET_PREBUILT_KERNEL := device/zte/warplte/kernel
#TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/warplte/recovery/kernel
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-linaro-4.6.2

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_PRODUCT := zte_warplte

# Board
TARGET_BOOTLOADER_BOARD_NAME := warplte
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM_FPU := neon

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# chargers
BOARD_CHARGER_RES := device/zte/warplte/charger

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/warplte/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/zte/warplte/bluetooth/vnd_warplte.txt

# QCOM
TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Display/Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
BOARD_EGL_CFG := device/zte/warplte/prebuilt/lib/egl/egl.cfg

#Thremal
BOARD_USES_EXTRA_THERMAL_SENSOR := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Camera
USE_CAMERA_STUB := false
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DZTE_8930_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Lights
#TARGET_PROVIDES_LIBLIGHTS := true

# Wifi
BOARD_HAS_QCOM_WLAN_SDK 	:= true
BOARD_HAS_QCOM_WLAN 		:= true
BOARD_WLAN_DEVICE 		:= qcwcn
BOARD_HOSTAPD_DRIVER 		:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB 	:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
HOSTAPD_VERSION 		:= VER_0_8_X
WIFI_DRIVER_FW_PATH_AP 		:= "ap"
WIFI_DRIVER_FW_PATH_P2P 	:= "p2p"
WIFI_DRIVER_FW_PATH_STA 	:= "sta"
WIFI_DRIVER_MODULE_ARG 		:= ""
WIFI_DRIVER_MODULE_NAME 	:= "wlan"
WIFI_DRIVER_MODULE_PATH 	:= "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION 		:= VER_0_8_X
###

# Filesystem
# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1082130432
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2122317824
BOARD_CACHEIMAGE_PARTITION_SIZE := 318767104
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
#BOARD_CUSTOM_GRAPHICS:= ../../../device/zte/warplte/recovery/graphics.c
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/warplte/recovery/recovery_keys.c
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_SDCARD_INTERNAL := true

BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_HAS_NO_SELECT_BUTTON := true

# EXT4 larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# Webkit
ENABLE_WEBGL := true

#vold
BOARD_VOLD_MAX_PARTITIONS := 24
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/zte/warplte/releasetools/ota_from_target_files