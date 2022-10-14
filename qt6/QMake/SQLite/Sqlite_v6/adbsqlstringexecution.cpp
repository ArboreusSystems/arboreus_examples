// ----------------------------------------------------------
/*!
	\class ADbSqlStringExecution
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/03/2021 at 12:33:29
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbsqlstringexecution.h"


// -----------
/*!
	\fn

	Doc.
*/

ADbSqlStringExecution::ADbSqlStringExecution(QObject *parent) : AThreadObjectTemplate(parent) {

	ALOG << "ADbSqlStringExecution created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADbSqlStringExecution::~ADbSqlStringExecution(void) {

	ALOG << "ADbSqlStringExecution deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADbSqlStringExecution::slRun(void) {

	this->mStringExecute();

	emit sgFinished();
	ALOG << "ADbSqlStringExecution run finished";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADbSqlStringExecution::mStringExecute(void) {

	QSqlDatabase oDB = QSqlDatabase::database(pProperties->Name);

	pReply = {};

	QSqlQuery oQuery(oDB);
	if (!oQuery.prepare(pProperties->String)) {
		ALOG << "Query for string not prepared";
		return;
	}
	if (!oQuery.exec()) {
		ALOG << "Query for string not executed";
		return;
	}

	QVariantList oOutput = {};
	int oCounter = 0;
	while (oQuery.next()) {
		QList<QVariant> oRecord = {};
		for (int i = 0; i < QSqlRecord(oQuery.record()).count(); ++i) {
			oRecord.insert(i,oQuery.value(i));
		}
		oOutput.insert(oCounter,oRecord);
		++oCounter;
	}

	pReply.Status = true;
	pReply.Output = oOutput;

	ALOG << "ADbSqlStringExecution string executed";
}
