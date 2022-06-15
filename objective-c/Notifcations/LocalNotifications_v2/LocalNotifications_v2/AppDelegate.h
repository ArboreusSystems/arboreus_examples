//
//  AppDelegate.h
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

#import "Notifications/ANotifications.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong,atomic) ANotifications* pNotifications;

@end

