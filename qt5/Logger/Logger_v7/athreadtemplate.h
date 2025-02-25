// ----------------------------------------------------------
/*!
	\headerfile AThreadTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 17:39:54
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATHREADTEMPLATE_H
#define ATHREADTEMPLATE_H

// System includes
#include <QThread>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AThreadTemplate : public QThread {

	Q_OBJECT

	public:

		explicit AThreadTemplate(QObject *parent = nullptr);
		virtual ~AThreadTemplate(void);

		void mStart(QThread::Priority inPriority);
		void mQuit(void);
		void mTerminate(void);
};

#endif // ATHREADTEMPLATE_H
