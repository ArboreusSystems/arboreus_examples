// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2020 at 15:03:15
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QJSEngine>
#include <QJSValue>

// Application includes
#include "aobjecttemplate.h"
#include "athreadtemplate.h"
#include "aloggerservice.h"
#include "aloggermodelmessage.h"

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
		static void mWriteToLog(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		void mEmitSgWriteToLog(ALoggerModelMessage* inMessage);

	signals:

		void sgWriteToLog(ALoggerModelMessage* inMessage);
		void sgLogUpdated(void);

	private:

		void mWriteToDB(QString inMessage);
		void mLogUpdated(void);
};

#endif // ALOGGER_H
