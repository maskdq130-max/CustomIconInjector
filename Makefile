TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomIconInjector

CustomIconInjector_FILES = Tweak.x
CustomIconInjector_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
