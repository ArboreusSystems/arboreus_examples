// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 07:35:43
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

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch() << QThread::currentThreadId()
#define ALOG_SYSTEM ALOG << "[SYSTEM]"
#define ALOG_QML ALOG << "[QML]"

// Namespace

// Class definitions
class ALoggerService : public QObject {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject* parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slLogEvent(const QString& inEvent);

};

#endif // ALOGGERSERVICE_H
