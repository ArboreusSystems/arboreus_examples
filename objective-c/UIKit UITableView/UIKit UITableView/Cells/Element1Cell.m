//
//  Element1Cell.m
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 02/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "Element1Cell.h"

@implementation Element1Cell

-(instancetype) init {

    self = [super init];
    if (self) {
        
        _pButtonAction = [[UIButton alloc] init];
        [_pButtonAction setTitle:@"Element 1 Button" forState:UIControlStateNormal];
        [_pButtonAction setTitleColor:__COLOR_BLACK forState:UIControlStateNormal];
        [_pButtonAction setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_pButtonAction setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_pButtonAction setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_pButtonAction setBackgroundColor:__COLOR_WHITE];
        [_pButtonAction setTintColor:__COLOR_WHITE];
        [_pButtonAction addTarget:self action:@selector(mButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_pButtonAction setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

-(void) layoutSubviews {

	[super layoutSubviews];
	
	[self addSubview:_pButtonAction];
	[[_pButtonAction.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
	[[_pButtonAction.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
	[[_pButtonAction.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
	[[_pButtonAction.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
}

-(void) awakeFromNib {

	[super awakeFromNib];
}

-(void) setSelected:(BOOL)selected animated:(BOOL)animated {

	[super setSelected:selected animated:animated];
}

-(void) mButtonAction {

	NSLog(@"mButtonAction on Element 1 clicked");
}

@end
