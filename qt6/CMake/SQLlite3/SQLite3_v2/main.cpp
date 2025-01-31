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
	oSQLite->mOpenDB(":memory");
	oSQLite->mPrepare("SELECT SQLITE_VERSION()");

	qDebug() << oSQLite->mStep();

    // -----------------------------------


	oEngine.loadFromModule("SQLite3_v1", "Main");

	return oApplication.exec();
}
