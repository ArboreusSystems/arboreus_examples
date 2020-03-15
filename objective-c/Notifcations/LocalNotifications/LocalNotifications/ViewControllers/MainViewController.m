//
//  MainViewController.m
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 15/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) viewDidLoad {

	[super viewDidLoad];
	self.view.backgroundColor = __COLOR_BLUE;
	
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

-(void) userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
	
	completionHandler(
		UNNotificationPresentationOptionAlert |
		UNNotificationPresentationOptionBadge |
		UNNotificationPresentationOptionSound
	);
}

-(void) userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {

	if ([response.notification.request.identifier  isEqual: @"test"]) {
		NSLog(@"Identifier: %@",response.notification.request.identifier);
		self.view.backgroundColor = __COLOR_WHITE;
	}
}

@end
