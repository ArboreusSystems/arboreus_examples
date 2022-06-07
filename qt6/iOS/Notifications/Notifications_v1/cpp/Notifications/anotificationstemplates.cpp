// ----------------------------------------------------------
/*!
	\class ANotificationsTemplates
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:58:34
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anotificationstemplates.h"


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsTemplates::ANotificationsTemplates(QObject *parent) : QObject(parent) {

	_A_DEBUG << "ANotificationsTemplates created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsTemplates::~ANotificationsTemplates(void) {

	_A_DEBUG << "ANotificationsTemplates deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ANotificationsTemplates::mModelMessage(void) {

	ANotificationModel oOutput;
	return oOutput.mToVariantMap();
}

