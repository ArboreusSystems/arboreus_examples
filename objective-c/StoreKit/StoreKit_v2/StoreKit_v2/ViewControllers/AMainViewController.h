//
//  AMainViewController.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <UIKit/UIKit.h>

#import "../Templates/AViewControllerTemplate.h"
#import "../Views/AItemsCollectionView.h"


NS_ASSUME_NONNULL_BEGIN

@interface AMainViewController : AViewControllerTemplate

@property (strong,atomic) AItemsCollectionView* pViewItems;

@end

NS_ASSUME_NONNULL_END
