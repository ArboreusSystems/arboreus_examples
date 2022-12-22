//
//  UIColorCategory.m
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 21/12/2022.
//

#import "UIColorCategory.h"

@implementation UIColor(ACategories)

+(UIColor *) mColorFromHex:(NSString *)inHexString {
    
    unsigned oRgbValue = 0;
    
    NSScanner* oScanner = [NSScanner scannerWithString:inHexString];
    [oScanner setScanLocation:1];
    [oScanner scanHexInt:&oRgbValue];
    
    float oRed = ((oRgbValue & 0xFF0000) >> 16)/255.0;
    float oGreen = ((oRgbValue & 0xFF00) >> 8)/255.0;
    float oBlue = (oRgbValue & 0xFF)/255.0;
    
    return [UIColor colorWithRed:oRed green:oGreen blue:oBlue alpha:1.0];
}

@end
