# Note : Please Keep this List alphabetically ordered
# Add Bootanim
ifneq ($(filter onerom_armani onerom_mako,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/onerom/prebuilt/bootanimation/720.zip:system/media/bootanimation.zip
endif
ifneq ($(filter onerom_shamu,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/onerom/prebuilt/bootanim/1080.zip:system/media/bootanimation.zip
endif
