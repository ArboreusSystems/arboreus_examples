//
//  ViewController.h
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import <UIKit/UIKit.h>

#import "../Definitions/AColorsDefinitions.h"
#import "../Notifications/ANotifications.h"

@interface AViewController : UIViewController

@property (weak,nonatomic) ANotifications* pNotifications;
@property (strong,atomic) UIButton* pButtonShowNotification;

@end

