// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 16:12:09
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
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>
#include <aloggerdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ALoggerService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slWriteToLog(ALoggerMessageModel* inMessage);

	signals:

		void sgLogUpdated(void);

	private:

		void mWriteToDB(ALoggerMessageModel* inMessage);
};

#endif // ALOGGERSERVICE_H
