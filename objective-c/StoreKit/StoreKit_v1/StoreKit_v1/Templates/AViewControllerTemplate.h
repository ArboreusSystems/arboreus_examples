//
//  AViewControllerTemplate.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 29/11/2022.
//

#import <UIKit/UIKit.h>

#import "../Definitions/AColorDefinitions.h"

NS_ASSUME_NONNULL_BEGIN

@interface AViewControllerTemplate : UIViewController

@property (strong,atomic) UIView* pViewContent;
@property (strong,atomic) UIView* pViewWrapper;
@property (strong,atomic) UIColor* pColorWrapper;

@property (nonatomic, assign) NSInteger pElementHeight;
@property (nonatomic, assign) NSInteger pElementWidth;

-(void) mSetColorWrapper:(UIColor*)inColor;

@end

NS_ASSUME_NONNULL_END
