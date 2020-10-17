// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 20:18:56
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
#include "../Templates/aobjecttemplate.h"

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch()
#define ALOG_SYSTEM ALOG << "[SYSTEM]"
#define ALOG_QML ALOG << "[QML]"

// Namespace


// Class definitions
class ALogger : public AObjectTemplate {

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
