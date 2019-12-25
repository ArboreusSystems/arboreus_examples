/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/12/2019 at 22:52:04
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

//#include <QtCore/QDebug>
//#include <QtCore/QJsonDocument>
//#include <QtCore/QCoreApplication>

//// Network
//#include <QtNetwork/QNetworkReply>
//#include <QtNetwork/QNetworkRequest>
//#include <QtNetwork/QNetworkAccessManager>


// Application includes
#include "aglobal.h"
#include "ahttp.h"

// Constants

// Qt Quick Application
int main(int argc, char *argv[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	AHttp* oHttpManager = new AHttp();
	oHttpManager->mGetJson("http://httpbin.org/get");

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
