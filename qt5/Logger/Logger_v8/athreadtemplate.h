// ----------------------------------------------------------
/*!
	\headerfile AThreadTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 14:22:56
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATHREADTEMPLATE_H
#define ATHREADTEMPLATE_H

// System includes
#include <QThread>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace
namespace ARB {

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

} // namespace ARB

#endif // ATHREADTEMPLATE_H
