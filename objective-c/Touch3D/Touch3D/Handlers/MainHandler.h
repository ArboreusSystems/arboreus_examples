//
//  MainHandler.h
//  Touch3D
//
//  Created by Alexandr Kirilov on 09/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIAlertController.h>
#import <UIKit/UIWindow.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainHandler : NSObject

+(void) mDoExit;
+(UIColor *) mCreateRandomColor;

@end

NS_ASSUME_NONNULL_END
