//
//  HGlobal.h
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HLogger.h"

NS_ASSUME_NONNULL_BEGIN

@interface HGlobal : NSObject {

	HLogger* pLogger;
}

+(HGlobal*) mInstance;

@end

NS_ASSUME_NONNULL_END
