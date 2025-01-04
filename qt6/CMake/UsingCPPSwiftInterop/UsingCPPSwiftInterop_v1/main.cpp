#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include <SwiftCPP.h>

int main(int argc, char *argv[]) {

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreated,
		&app, [url](QObject *obj, const QUrl &objUrl) {
			if (!obj && url == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);

	engine.load(url);

	qDebug() << "Swift test function:" << appUsingCPPSwiftInterop_v1::mTest();

	return app.exec();
}
