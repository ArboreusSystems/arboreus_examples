//
//  AItemViewCell.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 30/11/2022.
//

#import <StoreKit/StoreKit.h>

#import "../Templates/ATableViewCellTemplate.h"
#import "../Templates/ALabelTemplate.h"
#import "../Templates/AButtonTemplate.h"
#import "../Logger/ALogger.h"
#import "../StoreKit/AStoreKit.h"


NS_ASSUME_NONNULL_BEGIN

@interface AItemViewCell : ATableViewCellTemplate

@property (weak,nonatomic) SKProduct* pProduct;
@property (weak,nonatomic) AStoreKit* pStoreKit;

@property (strong,atomic) ALabelTemplate* pLabelName;
@property (strong,atomic) ALabelTemplate* pLabelDescription;
@property (strong,atomic) ALabelTemplate* pLabelPrice;
@property (strong,atomic) AButtonTemplate* pButtonBuy;

-(instancetype) initWithProduct:(SKProduct*)inProduct;

@end

NS_ASSUME_NONNULL_END
