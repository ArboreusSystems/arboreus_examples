//
//  AStoreKitItems.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 05/12/2022.
//

#import "AStoreKitItems.h"

@implementation AStoreKitItems


// ---------------------------------------
#pragma mark Init

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		[self setPConsumable:[[NSMutableSet alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Item.Consumable.00",
			@"systems.arboreus.test.StoreKit.Item.Consumable.01"
		]]];
		
		[self setPNonConsumable:[[NSMutableSet alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.00",
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.01",
			@"systems.arboreus.test.StoreKit.Item.NonConsumable.02"
		]]];
		
		[self setPRenewableSubscriptions:[[NSMutableSet alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.week.1",
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.month.1",
			@"systems.arboreus.test.StoreKit.Subscription.Renewable.month.2"
		]]];
		
		[self setPNonRenewableSubscriptions:[[NSMutableSet alloc] initWithArray:@[
			@"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.1",
			@"systems.arboreus.test.StoreKit.Subscription.NonRenewable.week.2"
		]]];
		
	}
	return self;
}

@end
