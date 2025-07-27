#include <main_pch.h>
#include <library_1_v3.h>
#include <library_2_v3.h>


int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);

	Library_1_v3* oLibrary1 = new Library_1_v3();
	Library_2_v3* oLibrary2 = new Library_2_v3();

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	engine.loadFromModule("Application_v3", "Main");

	return app.exec();
}
