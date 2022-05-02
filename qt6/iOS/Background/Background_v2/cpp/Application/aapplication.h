// ----------------------------------------------------------
/*!
	\headerfile AApplication
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 15:49:30
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATION_H
#define AAPPLICATION_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>
#include <athreadtemplate.h>
#include <aapplicationservice.h>

// Constants and definitions

// Global functions
#ifdef Q_OS_IOS
void fApplicationIOSDelegateInit(void);
#endif

// Namespace

// Classes
class ABackend;

// Class definitions
class AApplication : public AThreadTemplate<AApplicationService> {

	Q_OBJECT

	public:

		explicit AApplication(QObject* parent = nullptr);
		virtual ~AApplication(void);
		Q_DISABLE_COPY(AApplication)

		void mInit(void);

		void mOnWillQuit(void);
		void mOnDidBecomeActive(void);
		void mOnDidFinishLaunchWithOptions(void);
		void mOnDidEnterBackground(void);
		void mOnWillEnterBackground(void);
		void mOnDidEnterForeground(void);
		void mOnWillEnterForeground(void);

	public slots:

		void slInitiated(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);

		void sgOnWillQuit(void);
		void sgOnDidBecomeActive(void);
		void sgOnDidFinishLaunchWithOptions(void);
		void sgOnDidEnterBackground(void);
		void sgOnWillEnterBackground(void);
		void sgOnDidEnterForeground(void);
		void sgOnWillEnterForeground(void);

	private:

		ABackend* pBackend = nullptr;
};

#endif // AAPPLICATION_H
