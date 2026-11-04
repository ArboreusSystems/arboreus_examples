// ----------------------------------------------------------
/*!
	\headerfile ARevenueCatDriver
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/10/2026 at 19:41:46
	\endlist
*/
// ----------------------------------------------------------
#ifndef AREVENUECATDRIVER_H
#define AREVENUECATDRIVER_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ARevenueCatDriver : public QObject {

	Q_OBJECT

	public:

		explicit ARevenueCatDriver(QObject* parent = nullptr);
		virtual ~ARevenueCatDriver(void);

		virtual void mConfigure(void);
		virtual void mGetOfferings(void);
		virtual void mSubscribe(const QString& inPackageId);
		virtual void mRestore(void);
		virtual void mIsSubscribed(const QString& inEntitlementId);
		virtual void mManageSubscriptions(void);
		virtual void mLogIn(const QString& inUserId);
		virtual void mLogOut(void);

	signals:

		void mOfferingsFetched(const QVariantMap& outOfferings);
		void mSubscriptionStatusResult(const QString& inEntitlementId, bool isSubscribed);
		void mPurchaseSuccess(const QString& inPackageId);
		void mPurchaseFailed(const QString& inErrorDescription);
		void mRestoreSuccess();
		void mAuthSuccess(const QString& inUserId);

	// Explicit delegate event channels
		void mCustomerInfoUpdated(const QVariantMap& outEntitlementStatus);
};

#endif // AREVENUECATDRIVER_H
