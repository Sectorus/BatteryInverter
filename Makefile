ARCHS := arm64

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BatteryInverter

BatteryInverter_FILES = Tweak.xm
BatteryInverter_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
