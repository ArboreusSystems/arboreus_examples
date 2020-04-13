//
//  RootViewController.h
//  UIViewControllerLyfecycle
//
//  Created by Alexandr Kirilov on 13/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DefinitionColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController

@property (strong,atomic) NSString* pName;
@property (strong,atomic) NSString* pTestString1;
@property (strong,atomic) NSString* pTestString2;

-(void) mTestMethod1;
-(void) mTestMethod2;

@end

NS_ASSUME_NONNULL_END
