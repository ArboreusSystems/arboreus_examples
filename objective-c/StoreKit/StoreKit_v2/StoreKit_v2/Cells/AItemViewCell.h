//
//  AItemViewCell.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 05/01/2023.
//

#import <Foundation/Foundation.h>

#import "../Templates/ATableViewCellTemplate.h"
#import "../Templates/ALabelTemplate.h"
#import "../Templates/AButtonTemplate.h"
#import "../Logger/ALogger.h"
#import "../StoreKit/AStoreKit.h"


NS_ASSUME_NONNULL_BEGIN

@interface AItemViewCell : ATableViewCellTemplate

@property (weak,nonatomic) AStoreKitHandlerProduct* pProduct;
@property (weak,nonatomic) AStoreKit* pStoreKit;

@property (strong,atomic) ALabelTemplate* pLabelName;
@property (strong,atomic) ALabelTemplate* pLabelDescription;
@property (strong,atomic) ALabelTemplate* pLabelPrice;
@property (strong,atomic) AButtonTemplate* pButtonBuy;

-(instancetype) initWithProduct:(AStoreKitHandlerProduct*)inProduct;

@end

NS_ASSUME_NONNULL_END
