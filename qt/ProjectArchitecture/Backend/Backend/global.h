// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 21/08/2019 at 08:35:15
	\endlist
*/
// ----------------------------------------------------------

#ifndef GLOBAL_H
#define GLOBAL_H

#include <QDateTime>
#include <QDebug>

#define A_DEFAULT_STRING "default string"
#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // GLOBAL_H
