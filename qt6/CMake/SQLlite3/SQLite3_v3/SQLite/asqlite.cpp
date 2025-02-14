#include "asqlite.h"


ASqlite::ASqlite(QObject* parent) : QObject{parent} {

	qDebug() << "ASqlite created";
}

ASqlite::~ASqlite() {

	qDebug() << "ASqlite deleted";
}

sqlite3* ASqlite::mOpenDB(QString inPath) {

	sqlite3* oSQLiteDB = nullptr;

	int oStatus = sqlite3_open(inPath.toStdString().c_str(), &oSQLiteDB);
	if (oStatus != SQLITE_OK) {
		sqlite3_close(oSQLiteDB);
		qDebug() << "Can't create DB";
		return nullptr;
	}

	qDebug() << "DB created";
	return oSQLiteDB;
}

bool ASqlite::mCloseDB(sqlite3* inDB) {

	bool oOutput = sqlite3_close(inDB) == SQLITE_OK;

	if (oOutput) {
		qDebug() << "DB closed";
	} else {
		qDebug() << "Can't close DB";
	}

	return oOutput;
}

bool ASqlite::mExecute(sqlite3* inDB, QString inSQL) {

	char* oErrorMessage = nullptr;

	int oStatus = sqlite3_exec(
		inDB,inSQL.toStdString().c_str(),
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
