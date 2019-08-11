// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 09/08/2019 at 12:46:11
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

#include <QDateTime>
#include <QDebug>

#define A_APP_ORGANISATION "AR|BO|RE|US"
#define A_APP_DOMAIN "arboreus.systems"
#define A_APP_NAME_PHONE "Storage.Mobile"

#define A_DEFAULT_STRING "default string"

#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // AGLOBAL_H
