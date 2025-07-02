# Inherit mobile mini common Afterlife stuff
$(call inherit-product, vendor/afterlife/config/common_mobile_mini.mk)

# Inherit tablet common Afterlife stuff
$(call inherit-product, vendor/afterlife/config/tablet.mk)

$(call inherit-product, vendor/afterlife/config/telephony.mk)
