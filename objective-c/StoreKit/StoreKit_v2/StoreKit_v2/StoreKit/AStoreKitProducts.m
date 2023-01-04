//
//  AStoreKitProducts.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

#import "AStoreKitProducts.h"

@implementation AStoreKitProducts


// ---------------------------------------
#pragma mark Init

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		[self setPConsumable:[[NSMutableArray alloc] init]];
		[self setPNonConsumable:[[NSMutableArray alloc] init]];
		[self setPRenewableSubscriptions:[[NSMutableArray alloc] init]];
		[self setPNonRenewableSubscriptions:[[NSMutableArray alloc] init]];
		
	}
	return self;
}

@end
