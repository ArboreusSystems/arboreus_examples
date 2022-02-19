#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QThread>
#include "aworker.h"
#include "aprinter.h"
#include <QDateTime>
#include <QDebug>


int main(int inCounter, char* inArguments[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);

	qDebug() << QDateTime::currentMSecsSinceEpoch() << "Application main thread ID:" << QThread::currentThreadId();
	qDebug() << QDateTime::currentMSecsSinceEpoch() << "Application main thread:" << QThread::currentThread();

	AWorker *oWorker = new AWorker();
	APrinter *oPrinter = new APrinter();
	QThread *oThread = new QThread();

	oThread->start(QThread::LowestPriority);
	oPrinter->moveToThread(oThread);

	QObject::connect(
		oWorker,SIGNAL(sgValueGanged(int)),
		oPrinter,SLOT(slPrint(int))
	);
	oWorker->slStartDemo();

	QQmlApplicationEngine oEngine;
	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection);
	oEngine.load(oURL);

	return oApplication.exec();
}
