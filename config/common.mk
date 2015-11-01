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

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/orm/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/orm/prebuilt/common/bin/50-orm.sh:system/addon.d/50-orm.sh \
    vendor/orm/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/orm/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# orm-specific init file
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/etc/init.local.rc:root/init.orm.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/orm/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/orm/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/orm/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/orm/prebuilt/common/bin/sysinit:system/bin/sysinit

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    Launcher3 \
    LiveWallpapersPicker \
    PhaseBeam

# AudioFX
#PRODUCT_PACKAGES += \
#    AudioFX

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Extra Optional packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt \
    DashClock

#    ormFileManager removed until updated

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

# Stagefright FFMPEG plugin
#PRODUCT_PACKAGES += \
#    libffmpeg_extractor \
#    libffmpeg_omx \
#    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
#    media.sf.omx-plugin=libffmpeg_omx.so \
#    media.sf.extractor-plugin=libffmpeg_extractor.so

# TCM (TCP Connection Management)
PRODUCT_PACKAGES += \
    tcmiface

PRODUCT_BOOT_JARS += \
    tcmiface

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/orm/overlay/common

# Bootanim
include vendor/orm/config/bootanimation.mk

# Version
include vendor/orm/config/version.mk

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

EXTENDED_POST_PROCESS_PROPS := vendor/orm/tools/orm_process_props.py

