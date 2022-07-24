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
#include <aapplicationconfig.h>
#include <aapplicationservice.h>
#include <aapplicationdatamodels.h>
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

		AApplicationDelegate* pDelegate = nullptr;

		explicit AApplication(QObject* parent = nullptr);
		virtual ~AApplication(void);

		void mInit(void);
		void mOnQuit(void);
		void mOnLaunchFinished(void);

	public slots:

		void slInitiated(void);

		void mGetCurrentState(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);
		void sgOnDidStateChanged(_A_ENUM_APPLICATION_STATE inState);

	private:

		ABackend* pBackend = nullptr;
		AApplicationConfig* pConfig = nullptr;
		_A_ENUM_APPLICATION_STATE pCurrentState = _A_ENUM_APPLICATION_STATE::Undefined;

		void mInitStates(void);

	private slots:

		void slOnStateChanged(Qt::ApplicationState inState);
};

#endif // AAPPLICATION_H
