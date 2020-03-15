//
//  MainViewController.h
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 15/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "../Definitions/ColorsDefinitions.h"
#import "../Handlers/LogHandler.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UNUserNotificationCenterDelegate>

@end

NS_ASSUME_NONNULL_END
