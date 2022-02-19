// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 20:06:59
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes

// Application includes
#include "aobjecttemplate.h"
#include "athreadtemplate.h"
#include "aloggerservice.h"

// Constants and definitions

// Namespace

// Class definitions
class ALogger : public AObjectTemplate {

	Q_OBJECT

	public:

		AThreadTemplate* pThread = nullptr;
		ALoggerService* pService = nullptr;

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

		void mInitWithThread(AThreadTemplate* inThread);

	signals:

		void sgWriteToLog(const QString& inEvent);
		void sgLogUpdated(void);

	public slots:

		void mWriteToLog(const QString& inEvent);
		void mLogUpdated(void);
};

#endif // ALOGGER_H
