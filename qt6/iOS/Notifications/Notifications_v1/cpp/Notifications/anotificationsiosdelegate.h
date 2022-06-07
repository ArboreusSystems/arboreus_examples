// ----------------------------------------------------------
/*!
	\headerfile ANotificationsIOSDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:15:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFICATIONSIOSDELEGATE_H
#define ANOTIFICATIONSIOSDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <anotificationsdelegateinterface.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ANotificationsIOSDelegate :
	public QObject,
	public ANotificationsDelegateInterface {

	Q_OBJECT
	Q_INTERFACES(
		ANotificationsDelegateInterface
	)

	public:

		explicit ANotificationsIOSDelegate(QObject *parent = nullptr);
		virtual ~ANotificationsIOSDelegate(void);

		void mAdd(ANotificationModel inModel);
};

#endif // ANOTIFICATIONSIOSDELEGATE_H
