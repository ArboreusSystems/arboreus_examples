// ----------------------------------------------------------
/*!
	\headerfile AThreadTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 20:14:42
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
