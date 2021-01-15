// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2020 at 15:03:15
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>
#include <QDateTime>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		static ALogger& mInstance(void) {
			static ALogger oInstance;
			return oInstance;
		}
		static void mWriteToLog(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		void mWriteToConsole(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);

	public slots:

		void mWriteToLog(QString inMessage);

	private:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)
};

#endif // ALOGGER_H
