// ----------------------------------------------------------
/*!
	\headerfile ADbSqlStringExecution
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/03/2021 at 12:33:29
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBSQLSTRINGEXECUTION_H
#define ADBSQLSTRINGEXECUTION_H

// System includes
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>

// Application includes
#include <athreadobjecttemplate.h>
#include <adbsqlitedatamodels.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ADbSqlStringExecution : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		ADbSqliteReply pReply;
		ADbSqlStringProperties* pProperties = nullptr;

		explicit ADbSqlStringExecution(QObject *parent = nullptr);
		virtual ~ADbSqlStringExecution(void);

	public slots:

		void slRun() override;

	private:

		void mStringExecute(void);
};

#endif // ADBSQLSTRINGEXECUTION_H
