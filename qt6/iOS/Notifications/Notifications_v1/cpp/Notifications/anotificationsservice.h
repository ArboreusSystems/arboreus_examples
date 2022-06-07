// ----------------------------------------------------------
/*!
	\headerfile ANotificationsService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 21:20:52
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFICATIONSSERVICE_H
#define ANOTIFICATIONSSERVICE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>
#include <athreadservicetemplate.h>
#include <anotificationsdelegateinterface.h>
#include <anotificationsdatamodels.h>

// iOS includes
#if defined(Q_OS_IOS)
#include <anotificationsiosdelegate.h>
#endif

// Android includes
#if defined(Q_OS_ANDROID)
#include <anotifcationsandroiddelegate.h>
#endif

// Constants and definitions

// Namespace

// Class definitions
class ANotificationsService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ANotificationsService(QObject* parent = nullptr);
		virtual ~ANotificationsService(void);

	public slots:

		void slInit(void);
		void slAdd(ANotificationModel inModel);

	signals:

		void sgInitiated(void);

	private:

		ANotificationsDelegateInterface* pDelegate = nullptr;
};

#endif // ANOTIFICATIONSSERVICE_H
