PRODUCT_VERSION_MAJOR = 6.0
PRODUCT_VERSION_MINOR = EXPERIMENTAL
PRODUCT_VERSION_MAINTENANCE = 0.1


ifndef ONEROM_BUILD_TYPE
    ORM_BUILD_TYPE := HOMEMADE
    ORM_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
endif


# Set all versions
ORM_VERSION := OneRom-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(ORM_BUILD_TYPE)$(ORM_POSTFIX)
ORM_MOD_VERSION := OneRom-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.orm.version=$(ORM_VERSION) \
    ro.modversion=$(ORM_MOD_VERSION) \
    ro.orm.buildtype=$(ORM_BUILD_TYPE)
