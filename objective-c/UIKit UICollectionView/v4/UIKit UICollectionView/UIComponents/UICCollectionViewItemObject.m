//
//  UICCollectionViewItemObject.m
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 07/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "UICCollectionViewItemObject.h"

@implementation UICCollectionViewItemObject


// --------------------------------------
#pragma mark - Init

-(instancetype) init {

    self = [super init];
    if (self) {
    
        _pName = @"Default name";
        _pDescription = @"Default description";
        _pTimeString = @"00:00";
        _pTimeValue = @"0";
        
    }
    return self;
}

@end
