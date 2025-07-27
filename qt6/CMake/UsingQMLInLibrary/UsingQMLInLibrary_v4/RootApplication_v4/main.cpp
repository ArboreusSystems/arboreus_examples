#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <library1_v4.h>
#include <library2_v4.h>
#include <library3_v4.h>


int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	Library1_v4* oLibrary1 = new Library1_v4();
	Library2_v4* oLibrary2 = new Library2_v4();
	Library3_v4* oLibrary3 = new Library3_v4();

	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);

	engine.loadFromModule("RootApplication_v4", "Main");

	return app.exec();
}
