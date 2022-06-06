// ----------------------------------------------------------
/*!
	\headerfile AApplication
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:33:24
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATION_H
#define AAPPLICATION_H

// System includes
#include <QObject>

// Application includes
#include <aapplicationservice.h>
#include <athreadtemplate.h>

// iOS includes
#if defined(Q_OS_IOS)
#include <aapplicationiosdelegate.h>
#endif

// Android includes
#if defined(Q_OS_ANDROID)
#include <aapplicationandroiddelegate.h>
#endif

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AApplication : public AThreadTemplate<AApplicationService> {

	Q_OBJECT

	public:

		AApplicationDelegateInterface* pDelegate = nullptr;

		explicit AApplication(QObject* parent = nullptr);
		virtual ~AApplication(void);

		void mInit(void);

	public slots:

		void slInitiated(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);

	private:

		ABackend* pBackend = nullptr;
};

#endif // AAPPLICATION_H
