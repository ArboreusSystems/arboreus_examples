// ----------------------------------------------------------
/*!
	\headerfile AThread
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:00:58
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATHREAD_H
#define ATHREAD_H

// System includes
#include <QThread>

// Application includes
#include <aloggerservice.h>

// Constants and definitions

// Namespace

// Class definitions
class AThread : public QThread {

	Q_OBJECT

	public:

		explicit AThread(QObject* parent = nullptr);
		virtual ~AThread(void);

		void mQuit(void);
		void mTerminate(void);
};

#endif // ATHREAD_H
