// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/06/2020 at 20:09:18
	\endlist
*/
// ----------------------------------------------------------
#ifndef GLOBALDEFINITIONS_H
#define GLOBALDEFINITIONS_H

// System includes
#include <QDebug>
#include <QDateTime>

// Application includes

// Constants and defintions
#define A_TIME_CURRENT QDateTime::currentMSecsSinceEpoch()
#define A_CONSOLE qDebug()
#define A_CONSOLE_TEST A_CONSOLE << A_TIME_CURRENT

#endif // GLOBALDEFINITIONS_H
