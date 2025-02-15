#include "alibraryprivate.h"


ALibraryPrivate::ALibraryPrivate(QObject* parent) {

	qDebug() << "ALibraryPrivate created";
}

ALibraryPrivate::~ALibraryPrivate(void) {

	qDebug() << "ALibraryPrivate deleted";
}

int ALibraryPrivate::mOpenDB(QString inPath) {

	int oStatus = sqlite3_open(inPath.toStdString().c_str(),&pSQLiteDB);
	if (oStatus != SQLITE_OK) {
		sqlite3_close(pSQLiteDB);
		qDebug() << "Can't create DB";
	}

	qDebug() << "DB created";
	return oStatus;
}

bool ALibraryPrivate::mCloseDB() {

	bool oOutput = sqlite3_close(pSQLiteDB) == SQLITE_OK;

	if (oOutput) {
		qDebug() << "DB closed";
	} else {
		qDebug() << "Can't close DB";
	}

	return oOutput;
}

bool ALibraryPrivate::mExecute(QString inSQL) {

	char* oErrorMessage = nullptr;

	int oStatus = sqlite3_exec(
		pSQLiteDB,inSQL.toStdString().c_str(),
		nullptr,nullptr,&oErrorMessage
	);

	if (oStatus != SQLITE_OK) {
		qDebug() << "SQL error: " << oErrorMessage;
		sqlite3_free(oErrorMessage);
		return false;
	}

	qDebug() << "SQL executed";
	return true;
}

