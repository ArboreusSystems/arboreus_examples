//
//  MainViewController.h
//  HomeIndicatorHide_v1
//
//  Created by Alexandr Kirilov on 23.07.2021.
//

#import <UIKit/UIKit.h>
#import "../Definitions/DefineColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (nonatomic,assign) BOOL pHideHomeIndicator;
@property (nonatomic,strong) UIButton* pButton;

-(BOOL) prefersHomeIndicatorAutoHidden;
-(void) mSetHomeIndicatorAutoHidden;
-(void) mSetButtonTitle;

@end

NS_ASSUME_NONNULL_END
