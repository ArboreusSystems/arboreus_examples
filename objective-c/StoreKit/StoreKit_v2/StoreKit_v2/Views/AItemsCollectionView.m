//
//  AItemsCollectionView.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 05/01/2023.
//

#import "AItemsCollectionView.h"

@implementation AItemsCollectionView


// ---------------------------------
#pragma mark - Init

-(instancetype) initWithFrame:(CGRect)inFrame {
    
	self = [super initWithFrame:inFrame];
	if (self) {
		
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self setBackgroundColor:__COLOR_ORANGE];
		
		[self setPStoreKit:[AStoreKit mSharedInstance]];
		[_pStoreKit setPDelegate:self];
		
		[self setPButtonGetProducts:[[AButtonTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pButtonGetProducts setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pButtonGetProducts setTitle:@"Get products" forState:UIControlStateNormal];
		[_pButtonGetProducts addTarget:self action:@selector(mActionGetProducts:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_pButtonGetProducts];
		
		[self setPTableView:[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain]];
		[_pTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pTableView setBackgroundColor:__COLOR_SALAD_DARK];
		[_pTableView setDelegate:self];
		[_pTableView setDataSource:self];
		[self addSubview:_pTableView];
        
		[_pTableView registerClass:[AItemViewCell class] forCellReuseIdentifier:[AItemViewCell mIdentifier]];
        
	}
	return self;
}

-(void) layoutSubviews {
    
	[super layoutSubviews];
	
	[_pButtonGetProducts removeConstraints:[_pButtonGetProducts constraints]];
	[[_pButtonGetProducts.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
	[[_pButtonGetProducts.heightAnchor constraintEqualToConstant:80.0] setActive:YES];
	[[_pButtonGetProducts.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
	[[_pButtonGetProducts.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    
	[_pTableView removeConstraints:[_pTableView constraints]];
	[[_pTableView.topAnchor constraintEqualToAnchor:_pButtonGetProducts.bottomAnchor] setActive:YES];
	[[_pTableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
	[[_pTableView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
	[[_pTableView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
}


// ---------------------------------
#pragma mark - Actions

-(void) mActionGetProducts:(id)inSender {
	
	NSLog(@"ACTION Get products");
	
	[_pStoreKit mRequestProducts];
}

-(void) mActionBuyProduct:(id)inSender {
	
	
//	AItemViewCell* oCell = (AItemViewCell*)inSender;
	
	NSLog(@"ACTION Buy product");
}


// ---------------------------------
#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView*)inTableView {
    
//	NSLog(@"numberOfSectionsInTableView");
    
	return 4;
}

-(NSInteger) tableView:(UITableView*)inTableView numberOfRowsInSection:(NSInteger)inSection {
	
//	NSLog(@"Section number: %d",inSection);
	
	NSInteger oNumber = 0;
	switch (inSection) {
		case 0: oNumber = [_pStoreKit.pProducts.pConsumable count]; break;
		case 1: oNumber = [_pStoreKit.pProducts.pNonConsumable count]; break;
		case 2: oNumber = [_pStoreKit.pProducts.pRenewableSubscriptions count]; break;
		case 3: oNumber = [_pStoreKit.pProducts.pNonRenewableSubscriptions count]; break;
		default: break;
	}
	return oNumber;
}

-(UIView*) tableView:(UITableView*)inTableView viewForHeaderInSection:(NSInteger)inSection {
	
	UILabel* oLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	[oLabel setTextAlignment:NSTextAlignmentCenter];
	[oLabel setBackgroundColor:__COLOR_BLUE_DARK];
	[oLabel setTextColor:__COLOR_WHITE];
	switch (inSection) {
		case 0: [oLabel setText:@"Consumable"]; break;
		case 1: [oLabel setText:@"Non Consumable"]; break;
		case 2: [oLabel setText:@"Renewable Subscriptions"]; break;
		case 3: [oLabel setText:@"Non Renewable Subscriptions"]; break;
		default: [oLabel setText:@"NoTitleForHeader"]; break;
	}
	return oLabel;
}

-(CGFloat) tableView:(UITableView*)inTableView heightForHeaderInSection:(NSInteger)inSection {
	
	return 30;
}

-(UITableViewCell*) tableView:(UITableView*)inTableView cellForRowAtIndexPath:(NSIndexPath*)inIndexPath {

	NSUInteger oGroup = [inIndexPath indexAtPosition:0];
	NSUInteger oIndex = [inIndexPath indexAtPosition:1];
	
//	NSLog(@"cellForRowAtIndexPath: %@ Group: %d Element: %d",inIndexPath,oGroup,oIndex);
	
	AItemViewCell* oCell;
	switch (oGroup) {
		case 0:
			oCell = [[AItemViewCell alloc] initWithProduct:[
				_pStoreKit.pProducts.pConsumable objectAtIndex:oIndex
			]];
			break;
		case 1:
			oCell = [[AItemViewCell alloc] initWithProduct:[
				_pStoreKit.pProducts.pNonConsumable objectAtIndex:oIndex
			]];
			[oCell setBackgroundColor:__COLOR_ORANGE_DARK];
			break;
		case 2:
			oCell = [[AItemViewCell alloc] initWithProduct:[
				_pStoreKit.pProducts.pRenewableSubscriptions objectAtIndex:oIndex
			]];
			break;
		case 3:
			oCell = [[AItemViewCell alloc] initWithProduct:[
				_pStoreKit.pProducts.pNonRenewableSubscriptions objectAtIndex:oIndex
			]];
			[oCell setBackgroundColor:__COLOR_ORANGE_DARK];
			break;
		default:
			NSLog(@"ERROR! Wrong group id for item cell")
			break;
	}
	
	[oCell setNeedsUpdateConstraints];
	[oCell updateConstraintsIfNeeded];
	
	return oCell;
}

-(CGFloat) tableView:(UITableView*)inTableView heightForRowAtIndexPath:(NSIndexPath*)inIndexPath {
	
	CGFloat oOutput = 80.0;
	return  oOutput;
}


// ---------------------------------
#pragma mark - AStoreKitDelegate

-(void) mOnUpdateProducts {
	
	NSLog(@"VIEW mOnUpdateProducts");
	
	dispatch_async(dispatch_get_main_queue(), ^{
		[self->_pTableView reloadData];
	});
}

@end
