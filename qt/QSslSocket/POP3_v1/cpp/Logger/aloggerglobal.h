// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 09:17:54
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERGLOBAL_H
#define ALOGGERGLOBAL_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <QThread>
#include <QString>
#include <QStringRef>
#include <string>

// Application includes
#include <aloggerdatamodels.h>

// Constants and defintions
#define _A_LOGGER_DEFAULT_STRING_DEBUG "DBG"
#define _A_LOGGER_DEFAULT_STRING_INFO "INF"
#define _A_LOGGER_DEFAULT_STRING_WARNING "WRN"
#define _A_LOGGER_DEFAULT_STRING_CRITICAL "CRT"
#define _A_LOGGER_DEFAULT_STRING_FATAL "FTL"
#define _A_LOGGER_DEFAULT_STRING_UNDEFINED "NDF"
#define _A_LOGGER_DEFAULT_STRING_SYSTEM "SYS"
#define _A_LOGGER_DEFAULT_STRING_USER "USR"
#define _A_LOGGER_DEFAULT_STRING_NETWORK "NET"

#define _A_DEBUG qDebug()
#define _A_USER qDebug() << _A_LOGGER_DEFAULT_STRING_USER
#define _A_INFO qInfo()
#define _A_WARNING qWarning()
#define _A_CRITICAL qCritical()
#define _A_FATAL(inMessage) qFatal(inMessage)

// Namespace


// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fLoggerWriteToConsole(ALoggerMessageModel* inModel) {

#ifdef QT_DEBUG

	switch (inModel->Type) {
		case QtDebugMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_DEBUG,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
		case QtInfoMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_INFO,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
		case QtWarningMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_WARNING,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
		case QtCriticalMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_CRITICAL,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
		case QtFatalMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_FATAL,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
		default:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_UNDEFINED,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message,
				inModel->Function,inModel->File,inModel->Line
			);
			break;
	}

#else

	switch (inModel->Type) {
		case QtDebugMsg:
			break;
		case QtInfoMsg:
			fprintf(stderr,"%s:%s %llu %s %s\n",
				_A_LOGGER_DEFAULT_STRING_INFO,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message
			);
			break;
		case QtWarningMsg:
			fprintf(stderr,"%s:%s %llu %s %s\n",
				_A_LOGGER_DEFAULT_STRING_WARNING,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message
			);
			break;
		case QtCriticalMsg:
			fprintf(stderr,"%s:%s %llu %s %s\n",
				_A_LOGGER_DEFAULT_STRING_CRITICAL,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message
			);
			break;
		case QtFatalMsg:
			fprintf(stderr,"%s:%s %llu %s %s\n",
				_A_LOGGER_DEFAULT_STRING_FATAL,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message
			);
			break;
		default:
			fprintf(stderr,"%s:%s %llu %s %s\n",
				_A_LOGGER_DEFAULT_STRING_UNDEFINED,inModel->Author,
				inModel->Time,inModel->ThreadID,inModel->Message
			);
			break;
	}

#endif

}


// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fLoggerWriteToDB(ALoggerMessageModel* inModel) {

	Q_UNUSED(inModel)

#ifndef QT_DEBUG

#else

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fLoggerMessageHandler(
	QtMsgType inType, const QMessageLogContext& inContext, const QString& inMessage
) {

	QString oThreadIDString = QString("0x%1");
	QString oThreadIDValue = oThreadIDString.arg((long)QThread::currentThread(),0,16);
	std::string oThreadIDStdString = oThreadIDValue.toStdString();

	std::string oMessageStdString = inMessage.toStdString();

	ALoggerMessageModel oMessageModel;
	oMessageModel.Type = inType;
	oMessageModel.Time = QDateTime::currentMSecsSinceEpoch();
	oMessageModel.ThreadID = oThreadIDStdString.c_str();
	oMessageModel.Message = oMessageStdString.c_str();

	QString oAuthorString = inMessage.left(3);
	std::string oAuthor = oAuthorString.toStdString();
	if (
		oAuthor == _A_LOGGER_DEFAULT_STRING_USER ||
		oAuthor == _A_LOGGER_DEFAULT_STRING_SYSTEM ||
		oAuthor == _A_LOGGER_DEFAULT_STRING_NETWORK
	) {
		oMessageModel.Author = oAuthor.c_str();
	} else {
		oMessageModel.Author = _A_LOGGER_DEFAULT_STRING_SYSTEM;
	}

#ifdef QT_DEBUG

	oMessageModel.File = inContext.file ? inContext.file : "no file";
	oMessageModel.Function = inContext.function ? inContext.function : "no function";

	fLoggerWriteToConsole(&oMessageModel);

#else

	Q_UNUSED(inContext);

	fLoggerWriteToConsole(&oMessageModel);
	fLoggerWriteToDB(&oMessageModel);


#endif

}

#endif // ALOGGERGLOBAL_H
