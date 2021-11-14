// ----------------------------------------------------------
/*!
	\class ADBSqlCipher
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 18:47:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adbsqlcipher.h"


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipher::ADBSqlCipher(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ADBSqlCipher created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipher::~ADBSqlCipher(void) {

	_A_DEBUG << "ADBSqlCipher deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADBSqlCipher::mStart(ADBSqlCipherProperties* inProperties) {

	pName = inProperties->Name;
	pPath = inProperties->Path;
	pValue = inProperties->Value;

	QSqlDatabase oDB = QSqlDatabase::addDatabase(A_DB_SQL_CIPHER_DRIVER,pName);
	oDB.setDatabaseName(pPath);
	if (pValue != QString(A_DB_NULL_VALUE)) {
		oDB.setPassword(pValue);
	}

	if (oDB.open()) {
		_A_DEBUG << "Opened DB:" << pPath;
		return true;
	}

	_A_CRITICAL << "Failed to open DB:" << pPath;
	return false;
}


// -----------
/*!
	\fn

	Doc.
*/

void ADBSqlCipher::mRemove(void) {

	{
		QSqlDatabase oDB = this->mGetDB();
		oDB.close();
		if (!oDB.isOpen()) {
			_A_DEBUG << "Closed DB:" << pPath;
		} else {
			_A_CRITICAL << "Failed to close DB:" << pPath;
		}
	}

	QSqlDatabase::removeDatabase(pName);
}


// -----------
/*!
	\fn

	Doc.
*/

QString ADBSqlCipher::mGetDBName(void) {

	return pName;
}


// -----------
/*!
	\fn

	Doc.
*/

QSqlDatabase ADBSqlCipher::mGetDB(void) {

	QSqlDatabase oDB = QSqlDatabase::database(pName);
	return oDB;
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipherReply ADBSqlCipher::mGetTableInfo(QString inTableName) {

	QString oSQLString = "PRAGMA table_info(" + inTableName + ");";
	ADBSqlCipherReply oOutput = this->mStringExecute(oSQLString);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipherReply ADBSqlCipher::mStringExecute(QString inQueryString) {

	ADBSqlCipherReply oReply = {};

	QSqlDatabase oDB = this->mGetDB();

	QSqlQuery oQuery(oDB);
	if (!oQuery.prepare(inQueryString)) {
		_A_CRITICAL << "Query not prepared:" << inQueryString;
		return oReply;
	}
	if (!oQuery.exec()) {
		_A_CRITICAL << "Query not executed:" << inQueryString;
		return oReply;
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

	oReply.Status = true;
	oReply.Output = oOutput;

	return oReply;
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipherReply ADBSqlCipher::mStringTransaction(QString inQueryString) {

	ADBSqlCipherReply oReply = {};

	QSqlDatabase oDB = this->mGetDB();

	if (oDB.transaction()) {
		QSqlQuery oQuery(oDB);
		if (!oQuery.prepare(inQueryString)) {
			_A_CRITICAL << "Transactioned query not prepared:" << inQueryString;
			return oReply;
		}
		if (!oQuery.exec()) {
			_A_CRITICAL << "Transactioned query not executed:" << inQueryString;
			return oReply;
		}
		if (!oDB.commit()) {
			_A_CRITICAL << "Transaction not committed for query:" << inQueryString;
			if (!oDB.rollback()) {
				_A_CRITICAL << "Transaction not rolled back for query:" << inQueryString;
			}
			return oReply;
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
		oReply.Status = true;
		oReply.Output = oOutput;
	} else {
		_A_CRITICAL << "Transaction not started for query: " << inQueryString;
	}

	return oReply;
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipherReply ADBSqlCipher::mQueryExecute(QSqlQuery inQuery) {

	ADBSqlCipherReply oReply = {};

	if (!inQuery.exec()) {
		_A_CRITICAL << "Query object not executed with error:" << inQuery.lastError().text();
		return oReply;
	}

	QVariantList oOutput = {};
	int oCounter = 0;
	while (inQuery.next()) {
		QList<QVariant> oRecord = {};
		for (int i = 0; i < QSqlRecord(inQuery.record()).count(); ++i) {
			oRecord.insert(i,inQuery.value(i));
		}
		oOutput.insert(oCounter,oRecord);
		++oCounter;
	}

	oReply.Status = true;
	oReply.Output = oOutput;

	return oReply;
}


// -----------
/*!
	\fn

	Doc.
*/

ADBSqlCipherReply ADBSqlCipher::mQueryTransaction(QSqlQuery inQuery) {

	ADBSqlCipherReply oReply = {};

	QSqlDatabase oDB = this->mGetDB();

	if (oDB.transaction()) {
		if (!inQuery.exec()) {
			_A_CRITICAL << "Transaction for QSqlQuery object not executed";
			return oReply;
		}
		if (!oDB.commit()) {
			_A_CRITICAL << "Transaction for QSqlQuery object not committed";
			if (!oDB.rollback()) {
				_A_CRITICAL << "Transaction for QSqlQuery object not rolled back";
			}
			return oReply;
		}
		QVariantList oOutput = {};
		int oCounter = 0;
		while (inQuery.next()) {
			QList<QVariant> oRecord = {};
			for (int i = 0; i < QSqlRecord(inQuery.record()).count(); ++i) {
				oRecord.insert(i,inQuery.value(i));
			}
			oOutput.insert(oCounter,oRecord);
			++oCounter;
		}
		oReply.Status = true;
		oReply.Output = oOutput;
	} else {
		_A_CRITICAL << "Transaction for QSqlQuery object not started";
	}

	return oReply;
}


// -----------
/*!
	\fn

	Doc.
*/

qlonglong ADBSqlCipher::mLastRowID(void) {

	long long oOutput = -1;
	ADBSqlCipherReply oReply = this->mStringExecute("SELECT last_insert_rowid();");

	if (oReply.Status) {
		oOutput = qvariant_cast<qlonglong>(
			qvariant_cast<QVariantList>(oReply.Output.at(0)).at(0)
		);
	}

	return oOutput;
}
