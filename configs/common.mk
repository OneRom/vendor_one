PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# OneRom init file
PRODUCT_COPY_FILES += \
    vendor/onerom/prebuilt/common/etc/init.local.rc:root/init.onerom.rc

# init.d support
PRODUCT_COPY_FILES += \
    vendor/onerom/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/onerom/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/onerom/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts 

# Rosa
PRODUCT_PACKAGES += \
    Rosa \
    Launcher3 

# Live Wallpapers and more Daydream packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhaseBeam \
    SoundRecorder \
    PhotoPhase
    
# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/onerom/overlay/common

# easy way to extend to add more packages
-include vendor/extra/product.mk

# Bootanim
-include vendor/onerom/configs/bootanim.mk

# Version
-include vendor/onerom/configs/version.mk


