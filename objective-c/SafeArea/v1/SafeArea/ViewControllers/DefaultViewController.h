//
//  DefaultViewViewController.h
//  SafeArea
//
//  Created by Alexandr Kirilov on 12/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DefinitionColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface DefaultViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic,assign) BOOL statusBarHidden;
@property (strong,atomic) UIView* pViewWarpper;
@property (strong,atomic) UIView* pViewContent;

@end

NS_ASSUME_NONNULL_END
