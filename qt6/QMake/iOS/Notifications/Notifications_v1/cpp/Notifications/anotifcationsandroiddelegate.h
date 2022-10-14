// ----------------------------------------------------------
/*!
	\headerfile ANotifcationsAndroidDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:16:49
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFCATIONSANDROIDDELEGATE_H
#define ANOTIFCATIONSANDROIDDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <anotificationsdelegateinterface.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ANotifcationsAndroidDelegate : public ANotificationsDelegateInterface {

	Q_OBJECT

	public:

		explicit ANotifcationsAndroidDelegate(QObject* parent = nullptr);
		virtual ~ANotifcationsAndroidDelegate(void);

		void mAdd(ANotificationModel inModel);
};

#endif // ANOTIFCATIONSANDROIDDELEGATE_H
