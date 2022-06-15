//
//  ANotifications.h
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@interface ANotifications : NSObject <UNUserNotificationCenterDelegate>

@property (weak,nonatomic) UNUserNotificationCenter* pNotificationCenter;
@property (strong,atomic) NSString* pDefaultNotificationID;

+(ANotifications*) mInstance;
-(void) mSend:(NSString*)inTitle inSubtitle:(NSString*)inSubtitle inBody:(NSString*)inBody inBadge:(NSInteger)inBadge inDelay:(NSInteger)inDelay;

@end

NS_ASSUME_NONNULL_END
