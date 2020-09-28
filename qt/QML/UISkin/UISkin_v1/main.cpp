/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/09/2020 at 19:46:56
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include "alogger.h"
#include "acolors.h"
#include "askin.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	ALogger* oLogger = new ALogger();
	oContext->setContextProperty("ALogger",oLogger);

	AColors* oColors = new AColors();
	oContext->setContextProperty("AColors",oColors);

	ASkin* oSkin = new ASkin(oColors,nullptr);
	oContext->setContextProperty("ASkin",oSkin);

	const QUrl oUrl(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oUrl](QObject *oObj, const QUrl &oObjUrl) {
			if (!oObj && oUrl == oObjUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oUrl);

	return oApplication.exec();
}
