#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTimer>
#include "atimer.h"


int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	ATimer *oTimer = new ATimer();
	oTimer->start();

	emit oTimer->sgStartTimer();

	QTimer::singleShot(5000,oTimer,SIGNAL(sgStopTimer()));

	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
