//
//  ViewController.h
//  GCD
//
//  Created by Alexandr Kirilov on 31/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Handler.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController

	@property CGFloat pScreenWidth;
	@property CGFloat pScreenHeight;
	-(void) mButtonExit;
	-(void) mButtonExitTouchUpInside: (id)sender;
	-(void) mLabelMessage;

@end

NS_ASSUME_NONNULL_END
