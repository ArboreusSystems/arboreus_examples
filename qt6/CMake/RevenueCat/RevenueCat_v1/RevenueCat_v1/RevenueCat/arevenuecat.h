// ----------------------------------------------------------
/*!
	\headerfile ARevenueCat
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/10/2026 at 16:20:07
	\endlist
*/
// ----------------------------------------------------------

#ifndef AREVENUECAT_H
#define AREVENUECAT_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <arevenuecatdriver.h>

// iOS includes
#if defined(Q_OS_IOS)
#include <arevenuecatdriverios.h>
#endif

// Android includes
#if defined(Q_OS_ANDROID)
#include <arevenuecatdriverandroid.h>
#endif

// Namespace

// Class definitions
class ARevenueCat : public QObject {

	Q_OBJECT

	public:

		explicit ARevenueCat(QObject* parent = nullptr);
		virtual ~ARevenueCat(void);

	public slots:

		void mConfigure(void);
		void mGetOfferings(void);
		void mSubscribe(const QString& inPackageId);
		void mRestore(void);
		void mIsSubscribed(const QString& inEntitlementId);
		void mManageSubscriptions(void);
		void mLogIn(const QString& inUserId);
		void mLogOut(void);

	private:

		ARevenueCatDriver* pDriver = nullptr;
};

#endif // AREVENUECAT_H
