#import <Preferences/Preferences.h>

@interface BetterCenterListController: PSListController {
}
@end

@implementation BetterCenterListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BetterCenter" target:self] retain];
	}
	return _specifiers;
}
-(void)twitter:(id)arg1 {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://twitter.com/manzopower"]];
    
}
-(void)donate:(id)arg1 {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=alexx91%40gmail%2ecom&lc=US&item_name=MPow%20tweaks&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHostedGuest"]];
    
}

-(void) sendEmailTo: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:alexx91@gmail.com"]];
}


-(void) mysite: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://mpow.altervista.org"]];
}


-(void) animateall: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/org.thebigboss.animateall"]];
}

-(void) animateallhd: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/org.thebigboss.animateallhd"]];
}


@end



@interface Download : PSListController {}
@end
@implementation Download
@end
