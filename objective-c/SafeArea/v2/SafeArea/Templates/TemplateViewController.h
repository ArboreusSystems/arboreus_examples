//
//  TemplateViewController.h
//  SafeArea
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DefinitionColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface TemplateViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong,atomic) UIView* pViewContent;
@property (strong,atomic) UIView* pViewWrapper;
@property (assign,nonatomic) BOOL pStatusBarHidden;

-(void) mSetStatusBarHidden: (BOOL)inStatus;
-(void) mHandlerTapGesture;

@end

NS_ASSUME_NONNULL_END
