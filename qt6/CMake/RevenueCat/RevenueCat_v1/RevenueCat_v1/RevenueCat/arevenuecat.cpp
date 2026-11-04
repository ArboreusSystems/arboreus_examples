/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/10/2026 at 16:20:07
 * */// --------------------------------------------------------------

// Class header
#include "arevenuecat.h"


// -----------
/*!
	\fn

	Doc.
*/

ARevenueCat::ARevenueCat(QObject* parent): QObject(parent) {

#if defined(Q_OS_ANDROID)
	pDriver = qobject_cast<ARevenueCatDriverAndroid*>(new ARevenueCatDriverAndroid(this));
#elif defined(Q_OS_IOS)
	pDriver = qobject_cast<ARevenueCatDriver*>(new ARevenueCatDriverIOS(this));
#else
	pDriver = new ARevenueCatDriver(this);
#endif

	_A_DEBUG << "ARevenueCat created";
}


// -----------
/*!
	\fn

	Doc.
*/

ARevenueCat::~ARevenueCat(void) {

	_A_DEBUG << "ARevenueCat deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mConfigure(void) {

	pDriver->mConfigure();
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mGetOfferings(void) {

	pDriver->mGetOfferings();
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mSubscribe(const QString& inPackageId) {

	pDriver->mSubscribe(inPackageId);
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mRestore(void) {

	pDriver->mRestore();
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mIsSubscribed(const QString& inEntitlementId) {

	pDriver->mIsSubscribed(inEntitlementId);
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mManageSubscriptions(void) {

	pDriver->mManageSubscriptions();
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mLogIn(const QString& inUserId) {

	pDriver->mLogIn(inUserId);
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCat::mLogOut(void) {

	pDriver->mLogOut();
}

