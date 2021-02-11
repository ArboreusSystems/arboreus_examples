// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 18:16:22
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QDateTime>

// Application includes
#include "aproperties.h"
#include "aloggerservice.h"
#include "athreadtemplate.h"

// Constants and definitions

// Namespace

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		AThreadTemplate* pThread = nullptr;
		ALoggerService* pService = nullptr;

		static ALogger& mInstance(AProperties* inProperties = nullptr);
		void mInitWithThread(AThreadTemplate* inThread);
		static void mWriteToLog(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		void mEmitSgWriteToLog(ALoggerMessageModel* inMessage);

	public slots:

		void mLogUpdated(void);

	signals:

		void sgWriteToLog(ALoggerMessageModel* inMessage);
		void sgLogUpdated(void);

	private:

		explicit ALogger(QObject* parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)

		void mSetup(void);
};

#endif // ALOGGER_H
