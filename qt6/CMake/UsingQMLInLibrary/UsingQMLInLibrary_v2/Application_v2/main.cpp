#include <main_pch.h>
#include <library_v2.h>


int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);

	Library_v2* oLibrary = new Library_v2();

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	engine.loadFromModule("Application_v2", "Main");

	return app.exec();
}
