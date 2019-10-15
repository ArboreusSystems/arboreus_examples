#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "athread.h"
#include <QObject>


int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	AThread *oThreadPriority1 = new AThread();
	oThreadPriority1->setObjectName("oThreadPriority1::NormalPriority");

	AThread *oThreadPriority2 = new AThread();
	oThreadPriority2->setObjectName("oThreadPriority2::IdlePriority");

	AThread *oThreadPriority3 = new AThread();
	oThreadPriority3->setObjectName("oThreadPriority3::HighestPriority");

	AThread *oThreadPriority4 = new AThread();
	oThreadPriority4->setObjectName("oThreadPriority4::HighPriority");

	AThread *oThreadPriority5 = new AThread();
	oThreadPriority5->setObjectName("oThreadPriority5::LowestPriority");

	AThread *oThreadPriority6 = new AThread();
	oThreadPriority6->setObjectName("oThreadPriority6::LowPriority");

	oThreadPriority1->start(QThread::NormalPriority);
	oThreadPriority2->start(QThread::IdlePriority);
	oThreadPriority3->start(QThread::HighestPriority);
	oThreadPriority4->start(QThread::HighPriority);
	oThreadPriority5->start(QThread::LowestPriority);
	oThreadPriority6->start(QThread::LowPriority);

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
