//
//  ObjectBuilder.h
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-26.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectInstance.h"

NS_ASSUME_NONNULL_BEGIN

@interface ObjectBuilder : NSObject

@property (retain,nonatomic) NSString *pTestString1;
@property (retain,nonatomic) NSString *pTestString2;
@property (retain,nonatomic) NSNumber *pVersion;

-(void) mSetString1: (NSString *) inString;
-(void) mSetString2: (NSString *) inString;
-(void) mSetVersion: (NSNumber *) inVersion;
-(ObjectInstance *) mBuildInstance;

@end

NS_ASSUME_NONNULL_END
