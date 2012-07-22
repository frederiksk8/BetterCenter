// BetterCenter  by MPow

#import <SpringBoard/SpringBoard.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


#define PreferencesFilePath [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences/com.mpow.bettercenter.plist"]
#define PreferencesChangedNotification "com.mpow.bettercenter.prefs"

#define GetPreference(name, type) type ## ForKeyWithDefault(prefsDict, @#name, (name))


static NSDictionary *prefsDict = nil;

static void preferenceChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	[prefsDict release];
	prefsDict = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
}

float last=0;
float portrait;
float landscape;

%hook SBBulletinListView


- (float)_iPadSlidingViewHeightInOrientation:(int)arg1{

portrait= [[prefsDict objectForKey:@"portrait"]floatValue]?:1024.0f;
landscape= [[prefsDict objectForKey:@"landscape"]floatValue]?:768.0f;

if (arg1==1 || arg1==2){
last = portrait;
}
else if (arg1==3 || arg1==4){
last = landscape;
}
return last;
}


- (void)adjustLayoutForAnimatedTableViewContentHeightChange:(float)arg1{
/*  

now this function is null
this function isn't needed if the heigh isn't mutable
so if you use the %orig the function cause the safemode!

				MPow		
				
*/
}


%end



__attribute__((constructor)) static void fis_init() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// SpringBoard only!
	if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"])
		return;

	prefsDict = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, preferenceChangedCallback, CFSTR(PreferencesChangedNotification), NULL, CFNotificationSuspensionBehaviorCoalesce);

	[pool release];
}

