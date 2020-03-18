//
//  NotificationsHandler.m
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 17/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "NotificationsHandler.h"

@implementation NotificationsHandler

//- (void)testWithHandler:(UNAuthorizationStatus(^)(UNAuthorizationStatus result))handler {
//
//	UNUserNotificationCenter* oCenter = [UNUserNotificationCenter currentNotificationCenter];
//	[oCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
//		NSLog(@"Check settings.authorizationStatus: %li",settings.authorizationStatus);
//		dispatch_async(dispatch_get_main_queue(), ^{
//			handler((int)settings.authorizationStatus);
//		});
//	}];
//
////    [obj somemethodwithcompeltionblock:^{
////            int someInt = 10;
////            dispatch_async(dispatch_get_main_queue(), ^{
////                handler(10);
////            });
////      }
////      ];
//}
//
//
//- (UNAuthorizationStatus)callSite
//{
//    return [self testWithHandler:^(UNAuthorizationStatus testResult){
//		NSLog(@"Result was %ld", (long)testResult);
//		return testResult;
//    }];
//}

+(UNAuthorizationStatus) mCheckPermissions {

	__block UNAuthorizationStatus oOutput = UNAuthorizationStatusNotDetermined;
	dispatch_semaphore_t oSemaphore = dispatch_semaphore_create(0);

	UNUserNotificationCenter* oCenter = [UNUserNotificationCenter currentNotificationCenter];
	[oCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
		oOutput = settings.authorizationStatus;
		dispatch_semaphore_signal(oSemaphore);
	}];
	
	if (![NSThread isMainThread]) {
		dispatch_semaphore_wait(oSemaphore,DISPATCH_TIME_FOREVER);
	} else {
		while (dispatch_semaphore_wait(oSemaphore,DISPATCH_TIME_NOW)) {
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0]];
		}
	}

	return oOutput;
}

+(void) mAskPermissions {
	
	UNUserNotificationCenter* oCenter = [UNUserNotificationCenter currentNotificationCenter];
	UNAuthorizationOptions oOptions = UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound;
	[oCenter requestAuthorizationWithOptions:oOptions completionHandler:^(BOOL inGranted, NSError * _Nullable inError) {}];
}

-(void) mShowLocal:(NSString*) inID inTitle:(NSString*)inTitle inBody:(NSString*)inBody {
	
	UNUserNotificationCenter* oCenter = [UNUserNotificationCenter currentNotificationCenter];
	oCenter.delegate = self;
	UNAuthorizationOptions oOptions = UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound;
	[oCenter requestAuthorizationWithOptions:oOptions completionHandler:^(BOOL inGranted, NSError * _Nullable inError) {
		NSLog(@"Granted: %@",A_BOOL_STRING(inGranted));
		NSLog(@"Errors: %@",inError);
	}];
	
	UNMutableNotificationContent* oContent = [[UNMutableNotificationContent alloc] init];
	oContent.title = @"Content title";
	oContent.body = @"Content body";
	oContent.sound = [UNNotificationSound defaultSound];
	
	UNTimeIntervalNotificationTrigger* oTrigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
	
	UNNotificationRequest* oRequest = [UNNotificationRequest requestWithIdentifier:@"test" content:oContent trigger:oTrigger];
	[oCenter addNotificationRequest:oRequest withCompletionHandler:^(NSError * _Nullable inError) {
		NSLog(@"Completed. Errors: %@",inError);
	}];
}

@end
