include theos/makefiles/common.mk

BUNDLE_NAME = BetterCenter
BetterCenter_FILES = BetterCenter.mm
BetterCenter_INSTALL_PATH = /Library/PreferenceBundles
BetterCenter_FRAMEWORKS = UIKit
BetterCenter_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BetterCenter.plist$(ECHO_END)
