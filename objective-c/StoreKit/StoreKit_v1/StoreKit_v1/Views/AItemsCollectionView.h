//
//  AItemsCollectionView.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 30/11/2022.
//

#import <UIKit/UIKit.h>

#import "../Definitions/AColorDefinitions.h"
#import "../Logger/ALogger.h"
#import "../Cells/AItemViewCell.h"
#import "../StoreKit/AStoreKit.h"
#import "../Templates/AButtonTemplate.h"
#import "../Templates/AViewControllerTemplate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AItemsCollectionView : UIView <UITableViewDelegate,UITableViewDataSource,AStoreKitDelegate>

@property (weak,nonatomic) AStoreKit* pStoreKit;

@property (strong,atomic) AButtonTemplate* pButtonGetProducts;
@property (strong,atomic) UITableView* pTableView;

@end

NS_ASSUME_NONNULL_END