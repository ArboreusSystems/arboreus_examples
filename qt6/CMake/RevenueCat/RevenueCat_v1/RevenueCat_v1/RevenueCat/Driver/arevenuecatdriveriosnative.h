// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2026 at 20:30:24
	\endlist
*/
// ----------------------------------------------------------

#ifndef AREVENUECATDRIVERIOSNATIVE_H
#define AREVENUECATDRIVERIOSNATIVE_H

// Precompiled includes

// System includes
#import <StoreKit/StoreKit.h>
#import <UIKit/UIKit.h>

// RevenueCat includes
@import RevenueCat;

// Application includes

// Constants and defintions

// Class definition
@interface RCPurchasesDelegateBridge : NSObject <RCPurchasesDelegate>

@end

#endif // AREVENUECATDRIVERIOSNATIVE_H
