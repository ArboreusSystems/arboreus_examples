// ----------------------------------------------------------
/*!
	\headerfile Alogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/10/2022 at 09:40:38
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes

// Application includes
#include <aloggerglobal.h>
#include <aloggerpch.h>

// Constants and definitions

// Namespace

// Class definitions
class Alogger : public QObject {

	Q_OBJECT

	public:

		explicit Alogger(QObject* parent = nullptr);
		virtual ~Alogger(void);
};

#endif // ALOGGER_H
