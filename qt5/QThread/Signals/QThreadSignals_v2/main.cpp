/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/11/2020 at 11:27:24
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QThread>

// Application includes
#include "alogger.h"
#include "aobject.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	ALOG_SYSTEM << "Application creating starting";

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	QThread* oThreadHandler = new QThread();
	oThreadHandler->start(QThread::LowestPriority);

	AObjectHandler* oObjectHandler = new AObjectHandler();
	oObjectHandler->moveToThread(oThreadHandler);
	oContext->setContextProperty("AObjectHandler",oObjectHandler);
	AObject* oObject = new AObject(oObjectHandler,nullptr);
	oContext->setContextProperty("AObject",oObject);
	oObjectHandler->mTest(2);
	oObject->mTest();
	oObjectHandler->mTest(2);
	oObject->mTest();
	oObjectHandler->mTest(2);
	oObject->mTest();

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

	ALOG_SYSTEM << "Application started";

	return oApplication.exec();
}
