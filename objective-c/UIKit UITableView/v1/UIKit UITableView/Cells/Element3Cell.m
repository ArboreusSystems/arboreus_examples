//
//  Element3Cell.m
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 02/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "Element3Cell.h"

@implementation Element3Cell

-(instancetype) init {

    self = [super init];
    if (self) {

    }
    return self;
}

-(void) layoutSubviews {
	
	[super layoutSubviews];
	[self.textLabel setText:@"Element 3"];
}

-(void) awakeFromNib {

	[super awakeFromNib];
}

-(void) setSelected:(BOOL)selected animated:(BOOL)animated {

	[super setSelected:selected animated:animated];
}

+(NSString*) mIdentifier {

	return @"Element3Cell";
}

@end
