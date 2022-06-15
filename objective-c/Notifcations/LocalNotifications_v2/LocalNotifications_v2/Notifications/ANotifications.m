//
//  ANotifications.m
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import "ANotifications.h"

@implementation ANotifications

// ----------------------------------------
#pragma mark - Init

+(ANotifications*) mInstance {
	
	static ANotifications* oSharedInstance = nil;
	static dispatch_once_t oToken;
	dispatch_once(&oToken,^{
		oSharedInstance = [[ANotifications alloc] init];
		NSLog(@"ALocationManager created");
	});
	
	NSLog(@"ALocationManager instance return");
	return oSharedInstance;
}

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		[self setPDefaultNotificationID:@"DefaultNotificationID"];
		
		_pNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
		[_pNotificationCenter setDelegate:self];
		
	}
	NSLog(@"ALocationManager init");
	return self;
}

// ----------------------------------------
#pragma mark - Actions

-(void) mSend:(NSString*)inTitle inSubtitle:(NSString*)inSubtitle inBody:(NSString*)inBody inBadge:(NSInteger)inBadge inDelay:(NSInteger)inDelay {
	
	UNMutableNotificationContent* oContent = [[UNMutableNotificationContent alloc] init];
	oContent.title = inTitle;
	oContent.subtitle = inSubtitle;
	oContent.body = inBody;
	oContent.sound = [UNNotificationSound defaultSound];
	
	UNTimeIntervalNotificationTrigger* oTriger;
	if (inDelay != 0) {
		oTriger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:inDelay repeats:NO];
	} else {
		oTriger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
	}
	
	NSInteger oBadgeNumberCurrent = [[UIApplication sharedApplication] applicationIconBadgeNumber];
	if (inBadge > 0) oBadgeNumberCurrent += inBadge;
	
	UNNotificationRequest* oRequest = [UNNotificationRequest requestWithIdentifier:_pDefaultNotificationID content:oContent trigger:oTriger];
	
	[_pNotificationCenter addNotificationRequest:oRequest withCompletionHandler:^(NSError* _Nullable inError) {
			
			if (inError) {
				NSLog(@"Notification adding failed with error");
			} else {
				NSLog(@"Notification added");
			}
	}];
}


// ----------------------------------------
#pragma mark - UNUserNotificationCenterDelegate

-(void) userNotificationCenter:(UNUserNotificationCenter*)center willPresentNotification:(UNNotification*)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
	
	NSLog(@"willPresentNotification");
	completionHandler((UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound));
}

-(void) userNotificationCenter:(UNUserNotificationCenter*)center didReceiveNotificationResponse:(UNNotificationResponse*)response withCompletionHandler:(void (^)(void))completionHandler {
	
	NSLog(@"didReceiveNotificationResponse");
	
	NSString* oActionID = [response actionIdentifier];
	if ([oActionID isEqualToString:UNNotificationDismissActionIdentifier]) {
		NSLog(@"Notification dissmissed");
	} else if ([oActionID isEqualToString:UNNotificationDefaultActionIdentifier]) {
		NSLog(@"Notification opened the app");
	} else {
		NSLog(@"Default action");
	}

	completionHandler();
}

@end
