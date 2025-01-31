#include "asqlite.h"


ASqlite::ASqlite(QObject* parent) : QObject{parent} {

	qDebug() << "ASqlite created";
}

ASqlite::~ASqlite() {

	qDebug() << "ASqlite deleted";
}

int ASqlite::mOpenDB(QString inPath) {

	int oOutput = SQLITE_ERROR;

	pResult = sqlite3_open(":memory:",&pSQLiteDB);
	if (pResult != SQLITE_OK) {
		qDebug() << "Can't open database:" << sqlite3_errmsg(pSQLiteDB);
	} else {
		qDebug() << "Opened DB:" << inPath;
		oOutput = SQLITE_OK;
	}

	return oOutput;
}

int ASqlite::mCloseDB(void) {

	qDebug() << "Closing DB";

	sqlite3_finalize(pStatement);
	return sqlite3_close(pSQLiteDB);
}

int ASqlite::mPrepare(QString inSQL) {

	int oOutput = SQLITE_ERROR;

	if (pSQLiteDB) {
		pResult = sqlite3_prepare_v2(pSQLiteDB,inSQL.toUtf8().constData(),-1,&pStatement,0);
		if (pResult != SQLITE_OK) {
			qDebug() << "Failed to fetch data:" << sqlite3_errmsg(pSQLiteDB);
			oOutput = this->mCloseDB();
		} else {
			qDebug() << "Fetched data";
		}
	}

	return oOutput;
}

QString ASqlite::mStep(void) {

	QString oOutput = "no_result";

	pResult = sqlite3_step(pStatement);
	if (pResult == SQLITE_ROW) {
		oOutput = QString::fromUtf8((char*)sqlite3_column_text(pStatement,0));
	}

	return oOutput;
}
