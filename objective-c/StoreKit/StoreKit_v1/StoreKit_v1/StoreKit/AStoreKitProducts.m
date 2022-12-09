//
//  AStoreKitProducts.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
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
