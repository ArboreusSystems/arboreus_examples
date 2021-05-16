// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 13:55:25
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERGLOBAL_H
#define ALOGGERGLOBAL_H

// System includes
#include <QDebug>
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QStandardPaths>
#include <QThread>
#include <QDateTime>

// Application includes
#include <adir.h>

// Constants and defintions
#define A_LOGGER_DEFAULT_TYPE_SYSTEM "SYS"
#define A_LOGGER_DEFAULT_TYPE_USER "USR"

#define A_DEBUG qDebug()
#define A_USER qDebug() << A_LOGGER_DEFAULT_TYPE_USER
#define A_INFO qInfo()
#define A_WARNING qWarning()
#define A_CRITICAL qCritical()
#define A_FATAL(inMessage) qFatal(inMessage)

// Namespace

// Global functions

// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fMessageHandler(
	QtMsgType inType, const QMessageLogContext& inContext, const QString& inMessage
) {

	const char* oThreadID = QString("0x%1").arg(
		(quintptr)QThread::currentThread(), QT_POINTER_SIZE * 2, 16, QChar('0')
	).toStdString().c_str();
	const char* oFunction = inContext.function ? inContext.function : "no function";
	const char* oFile = inContext.file ? inContext.file : "no file";
	int64_t oTime = QDateTime::currentMSecsSinceEpoch();

	switch (inType) {
		case QtDebugMsg:
			fprintf(stderr,"[DBG] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
		case QtInfoMsg:
			fprintf(stderr,"[INF] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
		case QtWarningMsg:
			fprintf(stderr,"[WRN] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
		case QtCriticalMsg:
			fprintf(stderr,"[CRT] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
		case QtFatalMsg:
			fprintf(stderr,"[FTL] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
		default:
			fprintf(stderr,"[UNDEFINED] %llu %s %s [%s]:[%s]:[%u]\n",
				oTime,oThreadID,inMessage.toStdString().c_str(),
				oFunction,oFile,inContext.line
			);
			break;
	}
}

#endif // ALOGGERGLOBAL_H
