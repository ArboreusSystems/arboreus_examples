//
//  SecondViewController.h
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 14/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileVLCKit/MobileVLCKit.h"

#import "../Definitions/DefinitionColors.h"
#import "../Handlers/HandlerVLC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property HandlerVLC* pHandlerVLC;
@property VLCMediaPlayer* pPlayer;

@end

NS_ASSUME_NONNULL_END
