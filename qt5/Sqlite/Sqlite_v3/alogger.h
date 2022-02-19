// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 11:46:02
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
#define ALOG(inType) qDebug() << QDateTime::currentMSecsSinceEpoch() << inType << QThread::currentThreadId() << __FILE__ << __LINE__ << __FUNCTION__
#define ALOG_SYSTEM ALOG("[SYSTEM]")
#define ALOG_QML ALOG("[QML]")

// Namespace


// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

	public slots:

		void mWriteToLog(QString inMessage);
};


#endif // ALOGGER_H
