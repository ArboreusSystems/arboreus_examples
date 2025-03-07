//
//  UIColorCategory.h
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor(ACategories)

+(UIColor*) mColorFromHex:(NSString*)inHex;

@end

NS_ASSUME_NONNULL_END
