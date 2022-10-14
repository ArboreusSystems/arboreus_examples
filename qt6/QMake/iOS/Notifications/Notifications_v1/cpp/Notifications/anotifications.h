// ----------------------------------------------------------
/*!
	\headerfile ANotifications
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 21:17:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFICATIONS_H
#define ANOTIFICATIONS_H

// System includes
#include <QObject>

// Application includes
#include <anotificationsservice.h>
#include <athreadtemplate.h>
#include <anotificationstemplates.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ANotifications : public AThreadTemplate<ANotificationsService> {

	Q_OBJECT

	public:

		ANotificationsTemplates* pTemplates = nullptr;

		explicit ANotifications(QObject* parent = nullptr);
		virtual ~ANotifications(void);

		void mInit(void);
		void mAddHandler(ANotificationModel inModel);

	public slots:

		void slInitiated(void);

		void mAdd(QVariantMap inModel);

	signals:

		void sgInit(void);
		void sgInitiated(void);
		void sgAdd(ANotificationModel inModel);

	private:

		ABackend* pBackend = nullptr;
};

#endif // ANOTIFICATIONS_H
