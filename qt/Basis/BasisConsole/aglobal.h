// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 15:40:51
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

#include <QDateTime>
#include <QDebug>

#define A_DEFAULT_STRING "default string"

#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#define A_TEST_ITERATIONS_COUNT 10

#endif // AGLOBAL_H
