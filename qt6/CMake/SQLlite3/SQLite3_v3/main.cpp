#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include <asqlite.h>


int main(int argc, char *argv[]) {

	QGuiApplication oApplication(argc, argv);
	QQmlApplicationEngine oEngine;

	QObject::connect(
		&oEngine,&QQmlApplicationEngine::objectCreationFailed,
		&oApplication,[]() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);

    // -----------------------------------
    // SQLite demo
    // -----------------------------------

	ASqlite* oSQLite = new ASqlite(&oEngine);

	sqlite3* oSQLiteDB  = oSQLite->mOpenDB(":memory");
	if (oSQLiteDB) {
		oSQLite->mExecute(oSQLiteDB,"SELECT SQLITE_VERSION();");
		oSQLite->mCloseDB(oSQLiteDB);
	}

    // -----------------------------------

	oEngine.loadFromModule("SQLite3_v1", "Main");

	return oApplication.exec();
}
