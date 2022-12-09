//
//  ASKProduct.m
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 07/12/2022.
//

#import "ASKProductCategory.h"

@implementation SKProduct(ASKProduct)

-(BOOL) pIsPuchased {

	NSNumber* oNumber = objc_getAssociatedObject(self,gASKProductIsPurchasedKey);
    return [oNumber boolValue];
}

-(void) setPIsPuchased:(BOOL)inProperty {

    NSNumber* oNumber = [NSNumber numberWithBool:inProperty];
    objc_setAssociatedObject(self,gASKProductIsPurchasedKey,oNumber,OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber*) pCounter {
	
	NSNumber* oNumber = objc_getAssociatedObject(self,gASKProductCounterKey);
    return oNumber;
}

-(void) setPCounter:(NSNumber*)inPCounter {
	
	NSNumber* oNumber = [NSNumber numberWithBool:inPCounter];
    objc_setAssociatedObject(self,gASKProductCounterKey,oNumber,OBJC_ASSOCIATION_RETAIN);
}

@end
