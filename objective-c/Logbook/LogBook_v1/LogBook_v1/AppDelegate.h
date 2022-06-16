//
//  AppDelegate.h
//  LogBook_v1
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import <UIKit/UIKit.h>

#import "Logger/ALogger.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong,atomic) ALogger* pLogger;

@end

