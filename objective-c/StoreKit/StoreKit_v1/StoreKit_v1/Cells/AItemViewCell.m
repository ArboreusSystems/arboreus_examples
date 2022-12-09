//
//  AItemViewCell.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 30/11/2022.
//

#import "AItemViewCell.h"

@implementation AItemViewCell


// --------------------------------------------
#pragma mark Init

+(NSString *) mIdentifier {
    
    return @"ACellCurrentLocation";
}

-(instancetype) initWithProduct:(SKProduct*)inProduct {
	
	self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
	if (self) {
		
		[self setPProduct:inProduct];
		[self setPStoreKit:[AStoreKit mSharedInstance]];
		[self setBackgroundColor:__COLOR_BLUE];
		
		[self setPLabelName:[[ALabelTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pLabelName setText:_pProduct.localizedTitle];
		[self addSubview:_pLabelName];
		
		[self setPLabelDescription:[[ALabelTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pLabelDescription setText:_pProduct.localizedDescription];
		[_pLabelDescription setFont:[UIFont systemFontOfSize:16.0]];
		[self addSubview:_pLabelDescription];
		
		[self setPLabelPrice:[[ALabelTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pLabelPrice setText:[NSString stringWithFormat:@"%@",_pProduct.price]];
		[_pLabelPrice setFont:[UIFont systemFontOfSize:20.0]];
		[self addSubview:_pLabelPrice];
		
		[self setPButtonBuy:[[AButtonTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pButtonBuy setTitle:@"Buy" forState:UIControlStateNormal];
		[_pButtonBuy addTarget:self action:@selector(mActionBuyProduct:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_pButtonBuy];
		
	}
	return self;
}

-(void) layoutSubviews {
    
    [super layoutSubviews];
    
    [_pButtonBuy removeConstraints:[_pButtonBuy constraints]];
	[[_pButtonBuy.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
	[[_pButtonBuy.widthAnchor constraintEqualToConstant:70.0] setActive:YES];
	[[_pButtonBuy.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.75] setActive:YES];
	[[_pButtonBuy.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-10.0] setActive:YES];
	
	[_pLabelPrice removeConstraints:[_pLabelPrice constraints]];
	[[_pLabelPrice.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
	[[_pLabelPrice.rightAnchor constraintEqualToAnchor:_pButtonBuy.leftAnchor constant:5.0] setActive:YES];
	[[_pLabelPrice.heightAnchor constraintEqualToConstant:40.0] setActive:YES];
	[[_pLabelPrice.widthAnchor constraintEqualToConstant:65.0] setActive:YES];
	
	[_pLabelName removeConstraints:[_pLabelName constraints]];
	[[_pLabelName.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant:-5.0] setActive:YES];
	[[_pLabelName.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:10.0] setActive:YES];
	[[_pLabelName.heightAnchor constraintEqualToConstant:15.0] setActive:YES];
	[[_pLabelName.rightAnchor constraintEqualToAnchor:_pLabelPrice.leftAnchor] setActive:YES];

	[_pLabelDescription removeConstraints:[_pLabelDescription constraints]];
	[[_pLabelDescription.topAnchor constraintEqualToAnchor:self.centerYAnchor constant:5.0] setActive:YES];
	[[_pLabelDescription.leftAnchor constraintEqualToAnchor:_pLabelName.leftAnchor] setActive:YES];
	[[_pLabelDescription.heightAnchor constraintEqualToConstant:15.0] setActive:YES];
	[[_pLabelDescription.rightAnchor constraintEqualToAnchor:_pLabelPrice.leftAnchor] setActive:YES];
}


// --------------------------------------------
#pragma mark Actions

-(void) mActionBuyProduct:(id)inSender {
	
	NSLog(@"CELL Buy product: %@",_pProduct.productIdentifier);
	[_pStoreKit mBuyProduct:_pProduct];
}

@end
