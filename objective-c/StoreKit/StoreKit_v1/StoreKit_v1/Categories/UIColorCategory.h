//
//  UIColorCategory.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 29/11/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor(ACategories)

+(UIColor*) mColorFromHex:(NSString*)inHex;

@end

NS_ASSUME_NONNULL_END
