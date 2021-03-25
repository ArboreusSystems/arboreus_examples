// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 07:37:35
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QString>
#include <QThread>

// Application includes
#include <aloggerservice.h>
#include <athread.h>

// Constants and definitions

// Namespace

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

		void mWriteEvent(const QString& inEvent);

	signals:

		void sgLogEvent(const QString& inEvent);

	private:

		AThread* pThread = nullptr;
		ALoggerService* pService = nullptr;
};

#endif // ALOGGER_H
