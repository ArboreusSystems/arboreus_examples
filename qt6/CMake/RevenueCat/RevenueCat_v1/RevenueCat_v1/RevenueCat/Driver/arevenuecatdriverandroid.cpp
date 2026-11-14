// ----------------------------------------------------------
/*!
	\class ARevenueCatDriverAndroid
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/10/2026 at 19:42:52
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "arevenuecatdriverandroid.h"


// -----------
/*!
	\fn

	Doc.
*/

ARevenueCatDriverAndroid::ARevenueCatDriverAndroid(QObject* parent) : ARevenueCatDriver(parent) {

	_A_DEBUG << "ARevenueCatDriverAndroid created";
}


// -----------
/*!
	\fn

	Doc.
*/

ARevenueCatDriverAndroid::~ARevenueCatDriverAndroid(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mConfigure(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mConfigure started";

	QJniObject context = QNativeInterface::QAndroidApplication::context();
	QJniObject jApiKey = QJniObject::fromString(_A_ID_APLICATION_REVENUECAT);

	QJniObject::callStaticMethod<void>(
		"systems/arboreus/ARevenueNative/ARevenueBridge",
		"configure",
		"(Landroid/content/Context;Ljava/lang/String;)V",
		context.object(),
		jApiKey.object<jstring>()
	);

	_A_DEBUG << "ARevenueCatDriverAndroid::mConfigure finshed";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mGetOfferings(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetOfferings";
}


// -----------
/*!
	\fn

	Doc.
*/

QList<QVariantMap> ARevenueCatDriverAndroid::mGetProducts(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetProducts";

	QList<QVariantMap> oOutput;
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mSubscribe(const QString& inPackageId) {

	Q_UNUSED(inPackageId);

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribe";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mSubscribeWithRCProduct(const QString& inProductId) {

	Q_UNUSED(inProductId);

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribeWithRCProduct";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mRestore(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mRestore";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mIsSubscribed(const QString& inEntitlementId) {

	Q_UNUSED(inEntitlementId);

	_A_DEBUG << "ARevenueCatDriverAndroid::mIsSubscribed";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mManageSubscriptions(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mManageSubscriptions";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mLogIn(const QString& inUserId) {

	Q_UNUSED(inUserId);

	_A_DEBUG << "ARevenueCatDriverAndroid::mLogIn";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mLogOut(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mLogOut";
}
