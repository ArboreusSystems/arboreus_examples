/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 18/09/2020 at 20:29:49
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QMetaObject>
#include <QQmlContext>
#include <QVariant>

// Application includes
#include "alogger.h"
#include "acustomtype.h"
#include "aglobal.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	AGlobal& oGlobal = AGlobal::mInstance();
	oGlobal.pEngine = &oEngine;
	oContext->setContextProperty("AGlobal",&oGlobal);

	ALogger* oLogger = new ALogger();
	oContext->setContextProperty("ALogger",oLogger);

	qmlRegisterType<ACustomType>("Custom",1,0,"ACustomType");

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
