#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <alibrary.h>

int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);

	// -----------------------------------
	// SQLite demo
	// -----------------------------------

	ALibrary* oLibrary = new ALibrary(&engine);

	int oDBOpen = oLibrary->mOpenDB(":memory");
	if (oDBOpen == 0) {
		oLibrary->mExecute("SELECT SQLITE_VERSION();");
		oLibrary->mCloseDB();
	}

	// -----------------------------------

	engine.loadFromModule("Application", "Main");

	return app.exec();
}
