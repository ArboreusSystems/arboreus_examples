//
//  NotificationsHandler.h
//  LocalNotifications
//
//  Created by Alexandr Kirilov on 17/03/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import "../Definitions/ColorsDefinitions.h"
#import "../Handlers/LogHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationsHandler : NSObject <UNUserNotificationCenterDelegate>

+(UNAuthorizationStatus) mCheckPermissions;
+(void) mAskPermissions;
-(void) mShowLocal:(NSString*) inID inTitle:(NSString*)inTitle inBody:(NSString*)inBody;

@end

NS_ASSUME_NONNULL_END
