//
//  AMainViewController.h
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 21/12/2022.
//

#import <UIKit/UIKit.h>

#import "../Templates/AViewControllerTemplate.h"
#import "../AsyncAwait/AAsyncAwaitView.h"


NS_ASSUME_NONNULL_BEGIN

@interface AMainViewController : AViewControllerTemplate

@property (strong,atomic) AAsyncAwaitView* pAsyncAwaitView;

@end

NS_ASSUME_NONNULL_END
