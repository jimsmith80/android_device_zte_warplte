# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := zte_warplte

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/warplte/device_warplte.mk)

# Device naming
PRODUCT_DEVICE := warplte
PRODUCT_NAME := cm_warplte
PRODUCT_BRAND := zte
PRODUCT_MODEL := N9510
PRODUCT_MANUFACTURER := ZTE
