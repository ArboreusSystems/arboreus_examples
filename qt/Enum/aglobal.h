// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/11/2019 at 10:01:29
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H


// System includes
#include <QDateTime>
#include <QDebug>

// Application includes

// Constants and defintions
#define aLOG qDebug() << QDateTime::currentMSecsSinceEpoch()


#endif // AGLOBAL_H
