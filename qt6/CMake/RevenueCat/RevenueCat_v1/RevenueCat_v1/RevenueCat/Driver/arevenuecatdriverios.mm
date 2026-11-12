// ----------------------------------------------------------
/*!
	\class ARevenueCatDriverIOS
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/10/2026 at 19:42:17
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "arevenuecatdriverios.h"

// iOS includes
#import <arevenuecatdriveriosnative.h>

// Global Variables
static RCPurchasesDelegateBridge* s_delegateBridge = nil;


// -----------
// IOS part
// -----------



@implementation RCPurchasesDelegateBridge

-(void) purchases:(RCPurchases *)purchases receivedUpdatedCustomerInfo:(RCCustomerInfo *)customerInfo {

	// for (NSString *entitlementKey in customerInfo.entitlements.allKeys) {
	// 	RCEntitlementInfo *entitlement = customerInfo.entitlements[entitlementKey];
	// 	bool isActive = entitlement.isActive;
	// 	emit IAPManager::instance().customerInfoChanged(isActive, QString::fromNSString(entitlementKey));
	// }
}
@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

// -----------
/*!
	\fn

	Doc.
*/

ARevenueCatDriverIOS::ARevenueCatDriverIOS(QObject* parent) : ARevenueCatDriver(parent) {

	mConfigure();
	mGetOfferings();

	_A_DEBUG << "ARevenueCatDriverIOS created";
}


// -----------
/*!
	\fn

	Doc.
*/

ARevenueCatDriverIOS::~ARevenueCatDriverIOS(void) {

	_A_DEBUG << "ARevenueCatDriverIOS deleted";
}

// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mConfigure(void) {

	NSString* oApplicationID = @_A_ID_APLICATION_REVENUECAT;

	//    [RCPurchases setLogLevel:RCLogLevelVerbose];
	//    [RCPurchases configureWithAPIKey:oApplicationID];

	[RCPurchases setLogLevel:RCLogLevelVerbose];
	[RCPurchases configureWithConfiguration:[[RCConfiguration builderWithAPIKey:oApplicationID] build]];

	_A_DEBUG << "ARevenueCatDriverIOS::Configure";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mGetOfferings(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::GetOfferings";

	[[RCPurchases sharedPurchases] getOfferingsWithCompletion:^(RCOfferings* _Nullable inOfferings, NSError* _Nullable inError) {

		if (inError != nil) {
			_A_DEBUG << "Error while getting offerings from server:" << QString::fromNSString(inError.localizedDescription);
			return;
		}

		RCOffering* currentOffering = inOfferings.current;
		NSLog(@"offerings.current.description: %@",currentOffering.description);
		NSLog(@"offerings.current.identifier: %@",currentOffering.identifier);
		NSLog(@"offerings.current.identifier: %@",currentOffering.availablePackages);
	}];
}


// -----------
/*!
	\fn

	Doc.
*/

QList<QVariantMap> ARevenueCatDriverIOS::mGetProducts(void) {

	QList<QVariantMap> oOutput;

	NSArray<RCPackage*>* oAvailablePackages = [[[[RCPurchases sharedPurchases] cachedOfferings] current] availablePackages];
	for (RCPackage* iPackage in oAvailablePackages) {

		RCStoreProduct* iStoreProduct = iPackage.storeProduct;
		NSLog(@"------------------------------------");
		NSLog(@"oStoreProduct.hash: %lu",static_cast<unsigned long>(iStoreProduct.hash));
		NSLog(@"oStoreProduct.currencyCode: %@",iStoreProduct.currencyCode);
		NSLog(@"oStoreProduct.localizedTitle: %@",iStoreProduct.localizedTitle);
		NSLog(@"oStoreProduct.discounts: %@",iStoreProduct.discounts);
		if (@available(iOS 26.4, *)) {
			NSLog(@"oStoreProduct.installmentsInfo: %@",iStoreProduct.installmentsInfo);
		}
		NSLog(@"oStoreProduct.isFamilyShareable: %@",iStoreProduct.isFamilyShareable ? @"YES" : @"NO");
		NSLog(@"oStoreProduct.localizedDescription: %@",iStoreProduct.localizedDescription);
		NSLog(@"oStoreProduct.localizedIntroductoryPriceString: %@",iStoreProduct.localizedIntroductoryPriceString);
		NSLog(@"oStoreProduct.price: %@",iStoreProduct.price);
		NSLog(@"oStoreProduct.productIdentifier: %@",iStoreProduct.productIdentifier);
		NSLog(@"oStoreProduct.subscriptionGroupIdentifier: %@",iStoreProduct.subscriptionGroupIdentifier);
		NSLog(@"oStoreProduct.localizedPriceString: %@",iStoreProduct.localizedPriceString);

		QVariantMap iProduct;
		iProduct.insert(QLatin1StringView("RCIdentifier"),QString::fromNSString(iPackage.identifier));
		iProduct.insert(QLatin1StringView("SKIdentifier"),QString::fromNSString(iStoreProduct.productIdentifier));
		iProduct.insert(QLatin1StringView("Title"),QString::fromNSString(iStoreProduct.localizedTitle));
		iProduct.insert(QLatin1StringView("Description"),QString::fromNSString(iStoreProduct.localizedDescription));
		iProduct.insert(QLatin1StringView("Price"),QString::fromNSString(iStoreProduct.localizedPriceString));
		iProduct.insert(QLatin1StringView("Currency"),QString::fromNSString(iStoreProduct.currencyCode));

		oOutput.append(iProduct);
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mSubscribe(const QString& inPackageId) {

	NSString* oPackageId = inPackageId.toNSString();
	NSLog(@"oPackageId: %@",oPackageId);

	RCPackage* oPackage = nil;
	NSArray<RCPackage*>* oAvailablePackages = [[[[RCPurchases sharedPurchases] cachedOfferings] current] availablePackages];
	for (RCPackage* iPackage in oAvailablePackages) {
		NSLog(@"iPackage.identifier: %@",iPackage.identifier);
		if ([iPackage.storeProduct.productIdentifier isEqualToString:oPackageId]) {
			NSLog(@"iPackage.storeProduct.productIdentifier: %@",iPackage.storeProduct.productIdentifier);
			oPackage = iPackage;
			break;
		}
	}
	if (oPackage == nil) {
		NSLog(@"Error. Package is nil. Aborting purchase to prevent crash.");
		return;
	}

	[[RCPurchases sharedPurchases] purchasePackage:oPackage withCompletion:^(RCStoreTransaction* _Nullable inTransaction, RCCustomerInfo* _Nullable inCustomerInfo, NSError* _Nullable inError, BOOL inUserCancelled) {

		if (inUserCancelled) {
			NSLog(@"Purcahse canceled");
			return;
		}

		if (inError) {
			NSLog(@"Error: %@", inError.localizedDescription);
			return;
		}

		if (inCustomerInfo.entitlements[oPackageId].isActive) {
			NSLog(@"Purchase successfull.");
		}
	}];

	_A_DEBUG << "ARevenueCatDriverIOS::Subscribe";
}



// -----------
/*!
    \fn

    Doc.
*/

void ARevenueCatDriverIOS::mSubscribeWithRCProduct(const QString& inProductId) {

    NSString* oPackageId = inProductId.toNSString();
    NSLog(@"oPackageId: %@",oPackageId);

    RCPackage* oPackage = nil;
    NSArray<RCPackage*>* oAvailablePackages = [[[[RCPurchases sharedPurchases] cachedOfferings] current] availablePackages];
    for (RCPackage* iPackage in oAvailablePackages) {
        NSLog(@"iPackage.identifier: %@",iPackage.identifier);
        if ([iPackage.identifier isEqualToString:oPackageId]) {
            NSLog(@"iPackage.identifier: %@",iPackage.identifier);
            oPackage = iPackage;
            break;
        }
    }
    if (oPackage == nil) {
        NSLog(@"Error. Package is nil. Aborting purchase to prevent crash.");
        return;
    }

    [[RCPurchases sharedPurchases] purchasePackage:oPackage withCompletion:^(RCStoreTransaction* _Nullable inTransaction, RCCustomerInfo* _Nullable inCustomerInfo, NSError* _Nullable inError, BOOL inUserCancelled) {

        if (inUserCancelled) {
            NSLog(@"Purcahse canceled");
            return;
        }

        if (inError) {
            NSLog(@"Error: %@", inError.localizedDescription);
            return;
        }

        if (inCustomerInfo.entitlements[oPackageId].isActive) {
            NSLog(@"Purchase successfull.");
        }
    }];

    _A_DEBUG << "ARevenueCatDriverIOS::Subscribe";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mRestore(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::Restore";

	[[RCPurchases sharedPurchases] restorePurchasesWithCompletion:^(RCCustomerInfo* _Nullable inCustomerInfo, NSError* _Nullable inError) {

		if (inError != nil) {
			NSLog(@"Error restoring purchases: %@", inError.localizedDescription);
			return;
		}

		RCEntitlementInfo* oEntitlement = inCustomerInfo.entitlements[@"someID"];

		if (oEntitlement != nil && oEntitlement.isActive) {
			NSLog(@"Purchases restored! Pro access is active.");
		} else {
			NSLog(@"Restore completed, but no active subscriptions were found.");
		}
	}];
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mIsSubscribed(const QString& inEntitlementId) {

	Q_UNUSED(inEntitlementId);

	_A_DEBUG << "ARevenueCatDriverIOS::IsSubscribed";

	[[RCPurchases sharedPurchases] getCustomerInfoWithCompletion:^(RCCustomerInfo* _Nullable inCustomerInfo,NSError* _Nullable inError) {

        if (inError != nil) {
            NSLog(@"Error restoring purchases: %@", inError.localizedDescription);
            return;
        }

		NSDictionary<NSString*,RCEntitlementInfo*>* oActiveEntitlements = inCustomerInfo.entitlements.active;
		if (oActiveEntitlements.count == 0) {
			NSLog(@"No active subscriptions.");
			return;
		}

		for (NSString* iEntitlementID in oActiveEntitlements) {
			RCEntitlementInfo* iInfo = oActiveEntitlements[iEntitlementID];
			NSLog(@"Active Entitlement: %@ | Product ID: %@ | Expires: %@",iEntitlementID,iInfo.productIdentifier,iInfo.expirationDate);
		}
	}];
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mManageSubscriptions(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::ManageSubscriptions";

	[[RCPurchases sharedPurchases] showManageSubscriptionsWithCompletion:^(NSError * _Nullable inError) {
		if (inError != nil) {
			NSLog(@"Failed to open subscription management: %@", inError.localizedDescription);
		} else {
			NSLog(@"Subscription management closed.");
		}
	}];
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mLogIn(const QString& inUserId) {

	Q_UNUSED(inUserId);

	_A_DEBUG << "ARevenueCatDriverIOS::LogIn";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mLogOut(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::LogOut";
}



QT_END_NAMESPACE
