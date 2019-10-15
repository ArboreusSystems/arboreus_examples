#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QThread>
#include "aworker.h"
#include "aprinter.h"


int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	AWorker *oWorker = new AWorker();
	APrinter *oPrinter = new APrinter();
	QThread *oThread = new QThread();

	QObject::connect(
		oWorker,SIGNAL(sgValueGanged(int)),
		oPrinter,SLOT(slPrint(int))
	);

	oPrinter->moveToThread(oThread);
	oThread->start();

	oWorker->slStartDemo();

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
