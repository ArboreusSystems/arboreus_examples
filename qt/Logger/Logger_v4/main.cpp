/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 24/12/2020 at 19:54:22
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QThread>

// Application includes
#include "abackend.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	ALOG_SYSTEM << "Main thread:" << QThread::currentThreadId();

	ABackend* oBackend = &ABackend::mInstance(
		&oApplication,&oEngine,oEngine.rootContext()
	);
	oBackend->mInit();

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
