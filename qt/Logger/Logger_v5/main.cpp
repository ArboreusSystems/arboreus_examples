/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/10/2020 at 21:19:16
 * */// --------------------------------------------------------------

// System includes
#include <QtGlobal>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include "abackend.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext* oContext = oEngine.rootContext();

	ABackend* oBackend = &ABackend::mInstance(
		&oApplication,&oEngine,oEngine.rootContext()
	);
	qInstallMessageHandler(ALogger::mWriteToLog);
	oBackend->mInit();

	qInfo() << "Main thread:" << QThread::currentThreadId();

	qDebug() << "Debug";
	qInfo() << "Info";
	qWarning() << "Warning";
	qCritical() << "Critical";
//	qFatal("Fatal");
//	Q_ASSERT(0 != 0);

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
