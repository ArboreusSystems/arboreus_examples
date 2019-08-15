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

#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // AGLOBAL_H
