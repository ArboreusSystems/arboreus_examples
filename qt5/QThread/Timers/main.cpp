#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTimer>
#include <QThread>
#include "atimer.h"
#include "atimercontroller.h"


int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	aLOG << "Main application thread:" << QThread::currentThreadId();

	QThread *oTimerThread = new QThread();
	QThread *oControllerThread = new QThread();

	ATimer *oTimer = new ATimer();
	oTimer->moveToThread(oTimerThread);
	ATimerController *oController = new ATimerController();
	oController->moveToThread(oControllerThread);

	QObject::connect(
		oController,SIGNAL(sgStartTimer()),
		oTimer,SLOT(slStartTimer())
	);
	QObject::connect(
		oController,SIGNAL(sgStopTimer()),
		oTimer,SLOT(slStopTimer())
	);

	oTimerThread->start();
	oControllerThread->start();

	oController->mStartTimer();
	QTimer::singleShot(5000,oController,SIGNAL(sgStopTimer()));


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
