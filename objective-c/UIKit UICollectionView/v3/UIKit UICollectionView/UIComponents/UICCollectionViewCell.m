//
//  UICCollectionViewCell.m
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 01/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "UICCollectionViewCell.h"

@implementation UICCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame {

	self = [super initWithFrame:frame];
	if (self) {
	
		_pButton = [[UIButton alloc] init];
		[_pButton setBackgroundColor:__COLOR_GREEN];
		[self.contentView addSubview:self.pButton];
	
	}
	return self;
}

-(void) layoutSubviews{

    [super layoutSubviews];
	
	_pButton.frame = CGRectMake(
		self.frame.size.width / 2 - 44,
		self.frame.size.height / 2 - 22.5,
		88, 45
	);
}

+(NSString*) mGetClassID {

	return @"UICCollectionViewCell";
}

-(void) mSetupWithTitle:(NSString*)inTitle {

	[_pButton setTitle:inTitle forState:UIControlStateNormal];

}

@end
