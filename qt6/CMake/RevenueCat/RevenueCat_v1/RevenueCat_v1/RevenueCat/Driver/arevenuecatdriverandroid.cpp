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

	QJniObject oContext = QNativeInterface::QAndroidApplication::context();
	QJniObject oJavaAPIKey = QJniObject::fromString(_A_ID_APLICATION_REVENUECAT);

	QJniObject::callStaticMethod<void>(
		pRevenueBridgeClass,
		"mConfigure",
		"(Landroid/content/Context;Ljava/lang/String;)V",
		oContext.object(),
		oJavaAPIKey.object<jstring>()
	);

	_A_DEBUG << "ARevenueCatDriverAndroid::mConfigure finshed";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mGetOfferings(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetOfferings started";

	QJniObject::callStaticMethod<void>(
		pRevenueBridgeClass,
		"mGetOfferings",
		"()V"
	);

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetOfferings finished";
}


// -----------
/*!
	\fn

	Doc.
*/

QList<QVariantMap> ARevenueCatDriverAndroid::mGetProducts(void) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetProducts started";

	QList<QVariantMap> oOutput;

	QJniObject oJavaJSONString = QJniObject::callStaticObjectMethod(
		pRevenueBridgeClass,
		"mGetProducts",
		"()Ljava/lang/String;"
	);
	if (!oJavaJSONString.isValid()) return oOutput;

	QJsonDocument oJSONDocument = QJsonDocument::fromJson(oJavaJSONString.toString().toUtf8());
	if (!oJSONDocument.isArray()) return oOutput;

	const QJsonArray oJSONArray = oJSONDocument.array();
	for (const QJsonValue& iJSONValue : oJSONArray) {
		QJsonObject iJSONObject = iJSONValue.toObject();
		QVariantMap iProduct;
		iProduct.insert(QLatin1StringView("RCIdentifier"),iJSONObject.value("RCIdentifier").toString());
		iProduct.insert(QLatin1StringView("SKIdentifier"),iJSONObject.value("SKIdentifier").toString());
		iProduct.insert(QLatin1StringView("Title"),iJSONObject.value("Title").toString());
		iProduct.insert(QLatin1StringView("Description"),iJSONObject.value("Description").toString());
		iProduct.insert(QLatin1StringView("Price"),iJSONObject.value("Price").toString());
		iProduct.insert(QLatin1StringView("Currency"),iJSONObject.value("Currency").toString());
		oOutput.append(iProduct);
	}

	_A_DEBUG << "ARevenueCatDriverAndroid::mGetProducts finished";

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mSubscribe(const QString& inPackageId) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribe started";

	QJniObject oActivity = QNativeInterface::QAndroidApplication::context();
	QJniObject oJavaPackageId = QJniObject::fromString(inPackageId);

	QJniObject::callStaticMethod<void>(
		pRevenueBridgeClass,
		"mSubscribe",
		"(Landroid/app/Activity;Ljava/lang/String;)V",
		oActivity.object(),
		oJavaPackageId.object<jstring>()
	);

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribe finished";
}


// -----------
/*!
	\fn

	Doc.
*/

void ARevenueCatDriverAndroid::mSubscribeWithRCProduct(const QString& inProductId) {

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribeWithRCProduct";

	QJniObject oActivity = QNativeInterface::QAndroidApplication::context();
	QJniObject oJavaPackageId = QJniObject::fromString(inProductId);

	QJniObject::callStaticMethod<void>(
		pRevenueBridgeClass,
		"mSubscribeWithRCProduct",
		"(Landroid/app/Activity;Ljava/lang/String;)V",
		oActivity.object(),
		oJavaPackageId.object<jstring>()
	);

	_A_DEBUG << "ARevenueCatDriverAndroid::mSubscribeWithRCProduct finished";
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
