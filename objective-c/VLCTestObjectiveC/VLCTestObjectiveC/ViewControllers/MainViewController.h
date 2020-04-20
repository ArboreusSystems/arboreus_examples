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
#import "../Handlers/HandlerVLC.h"
#import "SecondViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (strong,atomic) HandlerVLC* pHandlerVLC;
@property (strong,atomic) UIView* pContent;
@property (strong,atomic) VLCMediaPlayer* pPlayer;
@property (strong,atomic) UIView* pPlayerView;
@property (strong,atomic) UIView* pPlayerOverlay;
@property (strong,atomic) UIView* pPlayerOverlayContent;
@property (strong,atomic) UIGestureRecognizer* pPlayerOverlayTapGesture;
@property (strong,atomic) UIButton* pButtonSecondVC;

@end

@class AppDelegate;

NS_ASSUME_NONNULL_END
