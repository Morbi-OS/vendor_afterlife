# Inherit common mobile Afterlife stuff
$(call inherit-product, vendor/afterlife/config/common.mk)

# Include Afterlife audio files
include vendor/afterlife/config/afterlife_audio.mk

# Sounds (default)
 PRODUCT_PRODUCT_PROPERTIES += \
     ro.config.ringtone=Cartel.ogg \
     ro.config.notification_sound=Casper.ogg \
     ro.config.alarm_alert=frenzy.ogg

# Apps
PRODUCT_PACKAGES += \
    AvatarPicker

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    AfterHomeQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    AfterHomeQuickStepGo
else
PRODUCT_PACKAGES += \
    AfterHomeQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    AfterHomeQuickStep
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub
