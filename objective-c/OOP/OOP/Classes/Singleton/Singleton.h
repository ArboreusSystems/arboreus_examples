//
//  Singleton.h
//  OOP
//
//  Created by Alexandr Kirilov on 2019-06-25.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property (retain,nonatomic) NSString *pTestString;

+(Singleton *) mGetInstance;
-(void) mSetTestString: (NSString *) inString;
-(NSString *) mGetString;

@end

NS_ASSUME_NONNULL_END
