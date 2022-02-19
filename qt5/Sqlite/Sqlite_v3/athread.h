// ----------------------------------------------------------
/*!
	\headerfile AThread
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 11:51:48
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATHREAD_H
#define ATHREAD_H

// System includes
#include <QThread>

// Application includes
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class AThread : public QThread {

	Q_OBJECT

	public:

		explicit AThread(QObject *parent = nullptr);
		virtual ~AThread(void);
};

#endif // ATHREAD_H
