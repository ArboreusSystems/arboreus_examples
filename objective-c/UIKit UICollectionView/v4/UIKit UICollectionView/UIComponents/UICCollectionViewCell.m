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
	
		pCreated = NO;
	
		_pButton = [[UIButton alloc] init];
		[_pButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pButton setBackgroundColor:__COLOR_GREEN];
		[self.contentView addSubview:self.pButton];
		
		_pName = [[UILabel alloc] init];
		[_pName setText:@"Default text"];
		[_pName setNumberOfLines:0];
		[_pName setBackgroundColor:__COLOR_WHITE];
		[_pName setLineBreakMode:NSLineBreakByWordWrapping];
		[_pName setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
		[_pName setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium]];
		[self.contentView addSubview:_pName];
	
	}
	return self;
}

-(void) layoutSubviews{

    [super layoutSubviews];
    
    [_pButton setFrame:CGRectMake(self.frame.size.width - 30.0, 10.0, 20.0, 20.0)];
	
	if (pCreated) {
		[_pName setFrame:CGRectMake(10.0, 10.0, self.frame.size.width - 10 - 10 - 20 - 20, [self mEstimatedFrameName].size.height)];
	}
}

+(NSString*) mGetClassID {

	return @"UICCollectionViewCell";
}

-(void) mSetupWithItem:(UICCollectionViewItemObject*)inItem {

	_pItem = inItem;
	
	[_pName setText:[_pItem pName]];
	[_pName setFrame:CGRectMake(10.0, 10.0, self.frame.size.width - 10 - 10 - 20 - 20, [self mEstimatedFrameName].size.height)];
	
	pCreated = YES;
}

-(CGRect) mEstimatedFrameName {

	CGFloat oWidth = self.frame.size.width - 10 - 10 - 20 - 20;
	CGSize oSize = CGSizeMake(oWidth, 1000);
	NSDictionary* oAttributes = @{NSFontAttributeName:[_pName font]};
	return [[_pItem pName] boundingRectWithSize:oSize options:NSStringDrawingUsesLineFragmentOrigin attributes:oAttributes context:nil];
}

-(void) mShowSelected:(BOOL)inStatus {

	if (inStatus) {
		[self.contentView setBackgroundColor:__COLOR_WHITE];
		[_pButton setBackgroundColor:__COLOR_PURPLE_LIGHT];
		[_pName setBackgroundColor:__COLOR_BLUE_DARK];
		[_pName setTextColor:__COLOR_WHITE];
	} else {
		[self.contentView setBackgroundColor:__COLOR_BLUE];
		[_pButton setBackgroundColor:__COLOR_GREEN];
		[_pName setBackgroundColor:__COLOR_WHITE];
		[_pName setTextColor:__COLOR_BLACK];
	}
}

@end
