# Inherit mini common Afterlife stuff
$(call inherit-product, vendor/afterlife/config/common_mini_tablet.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/afterlife/config/telephony.mk)
