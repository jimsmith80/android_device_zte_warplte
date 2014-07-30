$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warplte/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_TAGS += dalvik.gc.type-precise

#LOCAL_PATH := device/zte/warplte
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

#$(call inherit-product, $(LOCAL_PATH)/prebuilt/lib/modules/modules.mk)

# adb + root
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.adb.secure=0 \
	ro.debuggable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.alpha= Sprint \
    ro.cdma.home.operator.numeric= 310120

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
    
# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so
    
# GPS
PRODUCT_PACKAGES += \
    gps.msm8960
    
# GPS config
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# ramdisk
PRODUCT_COPY_FILES += \
	device/zte/warplte/ramdisk/fstab.qcom:root/fstab.qcom \
	device/zte/warplte/ramdisk/icon_ftm.png:root/icon_ftm.png \
	device/zte/warplte/ramdisk/init.ftm.rc:root/init.ftm.rc \
	device/zte/warplte/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
	device/zte/warplte/ramdisk/init.offcharge.rc:root/init.offcharge.rc \
	device/zte/warplte/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	device/zte/warplte/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
	device/zte/warplte/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
	device/zte/warplte/ramdisk/init.qcom.ftm.rc:root/init.qcom.ftm.rc \
	device/zte/warplte/ramdisk/init.qcom.rc:root/init.qcom.rc \
	device/zte/warplte/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/zte/warplte/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
	device/zte/warplte/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/zte/warplte/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
	device/zte/warplte/ramdisk/init.target.rc:root/init.target.rc \
	device/zte/warplte/ramdisk/init.target.ftm.rc:root/init.target.ftm.rc \
	device/zte/warplte/ramdisk/init.trace.rc:root/init.trace.rc \
	device/zte/warplte/ramdisk/init.usb.rc:root/init.usb.rc \
	device/zte/warplte/ramdisk/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
	device/zte/warplte/ramdisk/ueventd.rc:root/ueventd.rc \
	device/zte/warplte/ramdisk/logo.bmp:root/logo.bmp \
	device/zte/warplte/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
	device/zte/warplte/ramdisk/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
	device/zte/warplte/ramdisk/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png

# Charger
PRODUCT_PACKAGES += charger
	
## Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/usbconfig:recovery/prebuilt/root/sbin/usbconfig

# NFC
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt)

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# NFCEE access control
PRODUCT_COPY_FILES += \
    device/zte/warplte/prebuilt/etc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# OMX
PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libstagefrighthw \
        libmm-omxcore \
        libOmxCore \
        libc2dcolorconvert \
        libOmxVdecHevc \
        libOmxVdec \
        libOmxVenc \
        libOmxAacEnc \
        libOmxAmrEnc \
        libOmxEvrcEnc \
        libOmxQcelp13Enc \
        libdashplayer \
        qcmediaplayer

## Media & Display Firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/firmware/cyttsp_8064_mtp.hex:system/etc/firmware/cyttsp_8064_mtp.hex \
	$(LOCAL_PATH)/prebuilt/etc/firmware/cyttsp_8960_cdp.hex:system/etc/firmware/cyttsp_8960_cdp.hex \
	$(LOCAL_PATH)/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
	$(LOCAL_PATH)/prebuilt/etc/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
	$(LOCAL_PATH)/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
	$(LOCAL_PATH)/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
	$(LOCAL_PATH)/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	$(LOCAL_PATH)/prebuilt/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
	$(LOCAL_PATH)/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	$(LOCAL_PATH)/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	$(LOCAL_PATH)/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	$(LOCAL_PATH)/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
	$(LOCAL_PATH)/prebuilt/lib/libc2d2_a3xx.so:system/lib/libc2d2_a3xx.so \
	$(LOCAL_PATH)/prebuilt/lib/libc2d2_z180.so:system/lib/libc2d2_z180.so \
	$(LOCAL_PATH)/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
	$(LOCAL_PATH)/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
	$(LOCAL_PATH)/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
	$(LOCAL_PATH)/prebuilt/lib/libsc-a3xx.so:system/lib/libsc-a3xx.so \
	$(LOCAL_PATH)/prebuilt/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
	$(LOCAL_PATH)/prebuilt/lib/libOpenCL.so:system/lib/libOpenCL.so \
	$(LOCAL_PATH)/prebuilt/lib/libmm-abl-oem.so:system/lib/libmm-abl-oem.so \
	$(LOCAL_PATH)/prebuilt/lib/libmm-abl.so:system/lib/libmm-abl.so \
	$(LOCAL_PATH)/prebuilt/lib/libmmosal.so:system/lib/libmmosal.so \
	$(LOCAL_PATH)/prebuilt/lib/libmmparser.so:system/lib/libmmparser.so
	
# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs

# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
	$(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/prebuilt/etc/wifi/p2p_supplicant.conf:/system/etc/wifi/p2p_supplicant.conf \
	$(LOCAL_PATH)/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/prebuilt/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/prebuilt/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/prebuilt/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

PRODUCT_PACKAGES += \
	wpa_supplicant \
	wpa_cli

WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

## HostAP
PRODUCT_PACKAGES += \
    hostapd

## Bluetooth
PRODUCT_PACKAGES += \
	hci_qcomm_init

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio.a2dp.default \
        audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Graphics
PRODUCT_PACKAGES += \
    lights.msm8960 \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960 \
    power.msm8960 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils

# Qualcomm scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.efs.sync.sh:/system/etc/init.qcom.efs.sync.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.mdm_links.sh:/system/etc/init.qcom.mdm_links.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.modem_links.sh:/system/etc/init.qcom.modem_links.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot_ftm.sh:/system/etc/init.qcom.post_boot_ftm.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.post_fs.sh:/system/etc/init.qcom.post_fs.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.thermal_conf.sh:/system/etc/init.qcom.thermal_conf.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.thermald_conf.sh:/system/etc/init.qcom.thermald_conf.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh
	
# Time services
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/bin/time_daemon:system/bin/time_daemon \
	$(LOCAL_PATH)/prebuilt/lib/libtime_genoff.so:obj/lib/libtime_genoff.so \
	$(LOCAL_PATH)/prebuilt/lib/libtime_genoff.so:system/lib/libtime_genoff.so
	
#Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/thermald-8064.conf:system/etc/thermald-8064.conf \
	$(LOCAL_PATH)/prebuilt/etc/thermald-8930.conf:system/etc/thermald-8930.conf \
	$(LOCAL_PATH)/prebuilt/etc/thermald-8960.conf:system/etc/thermald-8960.conf \
	$(LOCAL_PATH)/prebuilt/etc/thermald-8960ab.conf:system/etc/thermald-8960ab.conf

# Other.... to lazy to be tidy at this point. This will all be vendor stuff when done
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/prebuilt/etc/audio_policy_8064.conf:system/etc/audio_policy_8064.conf \
	$(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/prebuilt/etc/hcidump.sh:system/etc/hcidump.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
	$(LOCAL_PATH)/prebuilt/etc/init.crda.sh:system/etc/init.crda.sh \
	$(LOCAL_PATH)/prebuilt/etc/usf_post_boot.sh:system/etc/usf_post_boot.sh \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_csvt_srvc.so:system/lib/libqmi_csvt_srvc.so \
	$(LOCAL_PATH)/prebuilt/lib/libv8.so:obj/lib/libv8.so \
	$(LOCAL_PATH)/prebuilt/lib/libacdbloader.so:obj/lib/libacdbloader.so

	
# Radio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/bin/mdm_helper:system/bin/mdm_helper \
	$(LOCAL_PATH)/prebuilt/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
	$(LOCAL_PATH)/prebuilt/bin/netmgrd:system/bin/netmgrd \
	$(LOCAL_PATH)/prebuilt/bin/qmuxd:system/bin/qmuxd \
	$(LOCAL_PATH)/prebuilt/bin/rild:system/bin/rild \
	$(LOCAL_PATH)/prebuilt/bin/rmt_storage:system/bin/rmt_storage \
	$(LOCAL_PATH)/prebuilt/lib/libdiag.so:system/lib/libdiag.so \
	$(LOCAL_PATH)/prebuilt/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
	$(LOCAL_PATH)/prebuilt/lib/libdsutils.so:system/lib/libdsutils.so \
	$(LOCAL_PATH)/prebuilt/lib/libnetmgr.so:system/lib/libnetmgr.so \
	$(LOCAL_PATH)/prebuilt/lib/libqdi.so:system/lib/libqdi.so \
	$(LOCAL_PATH)/prebuilt/lib/libqdp.so:system/lib/libqdp.so \
	$(LOCAL_PATH)/prebuilt/lib/libreference-ril.so:system/lib/libreference-ril.so \
	$(LOCAL_PATH)/prebuilt/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	$(LOCAL_PATH)/prebuilt/lib/libidl.so:system/lib/libidl.so \
	$(LOCAL_PATH)/prebuilt/lib/libqcci_legacy.so:system/lib/libqcci_legacy.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi.so:system/lib/libqmi.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_cci.so:system/lib/libqmi_cci.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_client_qmux.so:system/lib/libqmi_client_qmux.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_common_so.so:system/lib/libqmi_common_so.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_csi.so:system/lib/libqmi_csi.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmi_encdec.so:system/lib/libqmi_encdec.so \
	$(LOCAL_PATH)/prebuilt/lib/libqmiservices.so:system/lib/libqmiservices.so \
	$(LOCAL_PATH)/prebuilt/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
	$(LOCAL_PATH)/prebuilt/lib/libril.so:system/lib/libril.so
	
# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:/system/etc/permissions/android.hardware.telephony.cdma.xml


# APN
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# vold config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/mhl_rcp.kl:system/usr/keylayout/mhl_rcp.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Input device config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/cysp-touchscreen.idc:system/usr/idc/cysp-touchscreen.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/Fts-touchscreen.idc:system/usr/idc/Fts-touchscreen.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idcc \
	$(LOCAL_PATH)/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc\
	$(LOCAL_PATH)/prebuilt/usr/idc/syna-touchscreen.idc:system/usr/idc/syna-touchscreen.idc

# Prebuilt libraries that are needed for DRM playback
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml


# Sound configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES := \
	camera.msm8960

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_plugin.so:system/lib/libmmcamera_plugin.so

PRODUCT_PACKAGES += \
	Torch \
	FloatSysPop \
	DeviceSettings

## LTE/CDMA Device
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=1

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# call the prebuilt setup

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product-if-exists, vendor/zte/warplte/warplte-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)


