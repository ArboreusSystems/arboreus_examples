// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:44:01
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <aloggerservice.h>
#include <athread.h>

// Constants and definitions

// Namespace

// Class definitions
class ALogger : public AThread<ALoggerService> {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

		void mWriteToLog(const QString& inEvent);

	signals:

		void sgLogEvent(const QString& inEvent);
};

#endif // ALOGGER_H
