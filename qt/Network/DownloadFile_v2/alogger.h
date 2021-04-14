// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 14:06:29
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

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

// Classes
class ABackend;

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

		void mInit(void);

	public slots:

		void mWriteToLog(QString inMessage);

	private:

		ABackend* pBackend = nullptr;
};


#endif // ALOGGER_H
