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
		static void mWriteToLog(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		void mEmitSgWriteToLog(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		void mWriteToConsole(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);


	signals:

		void sgWriteToLog(QString inType);

	private:

		void mWriteToDB(QString inMessage);
};

#endif // ALOGGER_H
