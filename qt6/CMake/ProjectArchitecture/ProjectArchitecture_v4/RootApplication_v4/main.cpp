#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <alibrary1_v4.h>
#include <alibrary2_v4.h>
#include <alibrary3_v4.h>


int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;

	ALibrary1_v4* oLibrary1 = new ALibrary1_v4();
	ALibrary2_v4* oLibrary2 = new ALibrary2_v4();
	ALibrary3_v4* oLibrary3 = new ALibrary3_v4();

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
