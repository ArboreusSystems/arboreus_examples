// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:14:02
	\endlist
*/
// ----------------------------------------------------------
#ifndef ANOTIFICATIONSDELEGATEINTERFACE_H
#define ANOTIFICATIONSDELEGATEINTERFACE_H

// System includes

// Application includes
#include <anotificationsdatamodels.h>

// Constants and defintions

// Namespace

class ANotificationsDelegateInterface {

	public:

		virtual void mAdd(ANotificationModel inModel) = 0;
};

Q_DECLARE_INTERFACE(ANotificationsDelegateInterface,"ANotificationsDelegateInterface/1.0")

#endif // ANOTIFICATIONSDELEGATEINTERFACE_H
