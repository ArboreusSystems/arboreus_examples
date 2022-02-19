// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/07/2020 at 17:14:24
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>

// Application includes

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch()

#endif // ALOGGER_H
