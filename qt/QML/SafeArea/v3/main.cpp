/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 19:21:26
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QQmlContext>
#include <QDebug>
#include <QWindow>

// Application includes
#include "aglobal.h"
#include "alogger.h"
#include "asafearea.h"

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	AGlobal& oGlobal = AGlobal::mInstance();
	oContext->setContextProperty("AGlobal",&oGlobal);

	ALogger* oLogger = new ALogger();
	oContext->setContextProperty("ALogger",oLogger);

	ASafeArea* oSafeArea = new ASafeArea();
	oContext->setContextProperty("ASafeArea",oSafeArea);

	QWindow oWindow;
	ALOG << "Qwindow" << oWindow.devicePixelRatio();

	QScreen* oScreen = oApplication.primaryScreen();
	ALOG << "QScreen" << oScreen->devicePixelRatio();

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
