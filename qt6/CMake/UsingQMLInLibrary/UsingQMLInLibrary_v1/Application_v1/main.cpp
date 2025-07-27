#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <library_v1.h>


int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);

	Library_v1* oLibrary = new Library_v1();

	QQmlApplicationEngine engine;
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
					 &app, []() { QCoreApplication::exit(-1); },
	Qt::QueuedConnection);
	engine.loadFromModule("Application_v1", "Main");

	return app.exec();
}
