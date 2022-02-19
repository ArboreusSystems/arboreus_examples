// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 13:47:28
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>

// Application includes
#include <athreadtemplate.h>
#include <aloggerservice.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ALogger : public AThread<ALoggerService> {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);
		Q_DISABLE_COPY(ALogger)

		void mInit(void);

	signals:

		void sgInit(ADbSqliteProperties* inProperties);

	private:

		ABackend* pBackend = nullptr;
};

#endif // ALOGGER_H
