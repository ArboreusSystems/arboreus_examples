#include "asqlite.h"


ASqlite::ASqlite(QObject* parent) : QObject{parent} {

	qDebug() << "ASqlite created";
}

ASqlite::~ASqlite() {

	qDebug() << "ASqlite deleted";
}

int ASqlite::mOpenDB(QString inPath) {

	int oStatus = sqlite3_open(inPath.toStdString().c_str(),&pSQLiteDB);
	if (oStatus != SQLITE_OK) {
		sqlite3_close(pSQLiteDB);
		qDebug() << "Can't create DB";
	}

	qDebug() << "DB created";
	return oStatus;
}

bool ASqlite::mCloseDB(void) {

	bool oOutput = sqlite3_close(pSQLiteDB) == SQLITE_OK;

	if (oOutput) {
		qDebug() << "DB closed";
	} else {
		qDebug() << "Can't close DB";
	}

	return oOutput;
}

bool ASqlite::mExecute(QString inSQL) {

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
