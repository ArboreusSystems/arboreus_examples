//
//  UICCollectionViewItemObject.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 07/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UICCollectionViewItemObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICCollectionViewItemObject : NSObject

@property (atomic,strong) NSString* pName;
@property (atomic,strong) NSString* pDescription;
@property (atomic,strong) NSString* pTimeString;
@property (atomic,strong) NSString* pTimeValue;

@end

NS_ASSUME_NONNULL_END
