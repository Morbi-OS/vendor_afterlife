# Copyright (C) 2023-2025 AfterlifeOS
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

PRODUCT_VERSION_MAJOR = 8
PRODUCT_VERSION_MINOR = 0

ifeq ($(AFTERLIFE_VERSION_APPEND_TIME_OF_DAY),true)
    AFTERLIFE_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    AFTERLIFE_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

ifndef AFTERLIFE_GAPPS
    AFTERLIFE_ZIP_TYPE := Vanilla
else
    $(call inherit-product-if-exists, vendor/gms/products/gms.mk)

    ifdef GAPPS_CORE
        AFTERLIFE_ZIP_TYPE := CoreGApps
    else ifdef GAPPS_BASIC
        AFTERLIFE_ZIP_TYPE : BasicGApps
    else
        AFTERLIFE_ZIP_TYPE := GApps
    endif
endif

# Versioning
AFTERLIFE_CODENAME := BrotherHood
AFTERLIFE_VERSION_EXTRA := VanillaIceCream

AFTERLIFE_VERSION_SUFFIX := $(AFTERLIFE_BUILD_TYPE)_$(AFTERLIFE_BUILD_DATE)

# Internal version
AFTERLIFE_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)_$(AFTERLIFE_CODENAME)-$(AFTERLIFE_VERSION_SUFFIX)-$(AFTERLIFE_ZIP_TYPE)

# Display version
AFTERLIFE_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(AFTERLIFE_VERSION_SUFFIX)

# Codename version
AFTERLIFE_DISPLAY_VERSION_CODENAME := 15.1 | $(AFTERLIFE_CODENAME)

# AfterLife System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.afterlife.version=$(AFTERLIFE_VERSION) \
    ro.afterlife.releasetype=$(AFTERLIFE_BUILD_TYPE) \
    ro.afterlife.releasevarient=$(AFTERLIFE_ZIP_TYPE) \
    ro.afterlife.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.afterlife.version.codename=$(AFTERLIFE_CODENAME) \
    ro.afterlife.version.extra=$(AFTERLIFE_VERSION_EXTRA) \
    ro.afterlife.display.version=$(AFTERLIFE_DISPLAY_VERSION_CODENAME)