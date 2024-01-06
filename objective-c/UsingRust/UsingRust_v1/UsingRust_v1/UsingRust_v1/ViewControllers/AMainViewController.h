//
//  AMainViewController.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <UIKit/UIKit.h>

#import "../Templates/AViewControllerTemplate.h"
#import "../Templates/AButtonTemplate.h"
#import "../Templates/ALabelTemplate.h"
#import "../RustLibrary/UsingRust_v1.h"


NS_ASSUME_NONNULL_BEGIN

@interface AMainViewController : AViewControllerTemplate

@property (strong,atomic) AButtonTemplate* pButton;
@property (strong,atomic) ALabelTemplate* pLabel;

@end

NS_ASSUME_NONNULL_END
