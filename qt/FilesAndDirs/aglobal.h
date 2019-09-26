// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/09/2019 at 14:38:37
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

#include <QDateTime>
#include <QDebug>

#define A_DEFAULT_STRING "default string"

#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // AGLOBAL_H
