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

void ARevenueCatDriverIOS::mConfigure(const QString& inAPIKey) {

	Q_UNUSED(inAPIKey);

	_A_DEBUG << "ARevenueCatDriverIOS::Configure";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mGetOfferings(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::GetOfferings";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mSubscribe(const QString& inPackageId) {

	Q_UNUSED(inPackageId);

	_A_DEBUG << "ARevenueCatDriverIOS::Subscribe";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mRestore(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::Restore";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mIsSubscribed(const QString& inEntitlementId) {

	Q_UNUSED(inEntitlementId);

	_A_DEBUG << "ARevenueCatDriverIOS::IsSubscribed";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverIOS::mManageSubscriptions(void) {

	_A_DEBUG << "ARevenueCatDriverIOS::ManageSubscriptions";
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