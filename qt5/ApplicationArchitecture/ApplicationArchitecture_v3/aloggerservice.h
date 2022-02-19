// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 13:48:40
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes
#include <QObject>

// Application includes
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>
#include <adbsqlite.h>

// Constants and definitions

// Namespace

// Class definitions
class ALoggerService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slInit(ADbSqliteProperties* inProperties);

	private:

		ADbSqlite* pDBManager = nullptr;
};

#endif // ALOGGERSERVICE_H
