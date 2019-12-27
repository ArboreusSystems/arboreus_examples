// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/12/2019 at 20:11:39
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QDebug>
#include <QDateTime>

// Application includes

// Constants and defintions
#define A_MESSAGE_CONSOLE qDebug()
#define A_MESSAGE_DEBUG A_MESSAGE_CONSOLE << QDateTime::currentMSecsSinceEpoch()


#endif // AGLOBAL_H
