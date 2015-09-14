THEOS_DEVICE_IP = 192.168.199.220
ARCHS = arm64
TARGET = iphone:8.4



include theos/makefiles/common.mk
  
TWEAK_NAME = WeChatTweak
WeChatTweak_FILES = Tweak.xm HBCompose/HBComposeViewController.m HBCompose/UIImage+TweakBundle.m
WeChatTweak_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = WeChatTweakBundle
WeChatTweakBundle_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries
include $(THEOS)/makefiles/bundle.mk

after-install::
	install.exec "killall -9 WeChat"
