// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:44:27
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <QThread>

// Application includes
#include <aservice.h>

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch() << QThread::currentThreadId()
#define ALOG_SYSTEM ALOG << "[SYSTEM]"
#define ALOG_QML ALOG << "[QML]"

// Namespace

// Class definitions
class ALoggerService : public AService {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slLogEvent(const QString& inEvent);
};

#endif // ALOGGERSERVICE_H
