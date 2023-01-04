//
//  AStoreKitItems.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 04/01/2023.
//

#import "AStoreKitItems.h"

@implementation AStoreKitItems


// ---------------------------------------
#pragma mark Init

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		[self setPConsumable:[[NSMutableArray alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Item.Consumable.00",
			@"systems.arboreus.test.StoreKit.Item.Consumable.01"
		]]];
		
		[self setPNonConsumable:[[NSMutableArray alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.00",
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.01",
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.02"
		]]];
		
		[self setPRenewableSubscriptions:[[NSMutableArray alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.week.1",
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.month.1",
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.month.2"
		]]];
		
		[self setPNonRenewableSubscriptions:[[NSMutableArray alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.1",
			@"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.2"
		]]];
		
	}
	return self;
}

@end
