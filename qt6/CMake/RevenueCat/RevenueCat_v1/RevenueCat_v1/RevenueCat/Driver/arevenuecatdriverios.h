// ----------------------------------------------------------
/*!
	\headerfile ARevenueCatDriverIOS
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/10/2026 at 19:42:17
	\endlist
*/
// ----------------------------------------------------------
#ifndef AREVENUECATDRIVERIOS_H
#define AREVENUECATDRIVERIOS_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <arevenuecatdriver.h>
#include <revenue.conf.h>

// Namesapces

// Constants and definitions

// Class definitions
class ARevenueCatDriverIOS : public ARevenueCatDriver {

	Q_OBJECT

	public:

		explicit ARevenueCatDriverIOS(QObject* parent = nullptr);
		virtual ~ARevenueCatDriverIOS(void);

		void mConfigure(void) override;
		void mGetOfferings(void) override;
		QList<QVariantMap> mGetProducts(void) override;
		void mSubscribe(const QString& inPackageId) override;
		void mSubscribeWithRCProduct(const QString& inProductId) override;
		void mRestore(void) override;
		void mIsSubscribed(const QString& inEntitlementId) override;
		void mManageSubscriptions(void) override;
		void mLogIn(const QString& inUserId) override;
		void mLogOut(void) override;
};

#endif // AREVENUECATDRIVERIOS_H
