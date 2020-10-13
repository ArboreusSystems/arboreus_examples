// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:17:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QDateTime>
#include <QDebug>

// Application includes

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch()
#define ALOG_SYSTEM ALOG << "[SYSTEM]"
#define ALOG_QML ALOG << "[QML]"

// Namespace

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		static ALogger& mInstance(void) {
			static ALogger oInstance;
			return oInstance;
		}

	public slots:

		void mWriteToLog(QString inMessage);

	private:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)
};

#endif // ALOGGER_H
