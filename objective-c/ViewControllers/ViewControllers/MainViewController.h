//
//  MainViewController.h
//  ViewControllers
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Handler.h"
#import "AuxiliaryViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

	@property CGFloat pScreenWidth;
	@property CGFloat pScreenHeight;
	-(void) mButtonExit;
	-(void) mButtonExitTouchUpInside: (id)sender;
	-(void) mButtonAuxiliaryController;
	-(void) mButtonAuxiliaryControllerTouchUpInside: (id)sender;
	-(void) mLabelMessage;

@end

NS_ASSUME_NONNULL_END
