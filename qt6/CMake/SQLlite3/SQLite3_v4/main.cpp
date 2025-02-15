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

	int oDBOpen = oSQLite->mOpenDB(":memory");
	if (oDBOpen == SQLITE_OK) {
		oSQLite->mExecute("SELECT SQLITE_VERSION();");
		oSQLite->mCloseDB();
	}

    // -----------------------------------

	oEngine.loadFromModule("SQLite3_v4", "Main");

	return oApplication.exec();
}
