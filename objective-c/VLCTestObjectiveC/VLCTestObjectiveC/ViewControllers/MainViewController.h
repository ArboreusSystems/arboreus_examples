//
//  MainViewController.h
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileVLCKit/MobileVLCKit.h"
#import "../Definitions/DefinitionColors.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property VLCMediaPlayer* pPlayer;

@end

@class AppDelegate;

NS_ASSUME_NONNULL_END
