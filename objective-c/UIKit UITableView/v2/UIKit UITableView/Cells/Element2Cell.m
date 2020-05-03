//
//  Element2Cell.m
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 02/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "Element2Cell.h"

@implementation Element2Cell

-(instancetype) init {

    self = [super init];
    if (self) {
        [self.textLabel setText:@"Element 2"];
    }
    return self;
}

-(void) awakeFromNib {

	[super awakeFromNib];
}

-(void) setSelected:(BOOL)selected animated:(BOOL)animated {

	[super setSelected:selected animated:animated];
}

@end
