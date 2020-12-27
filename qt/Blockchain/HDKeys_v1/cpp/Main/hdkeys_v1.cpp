/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/12/2020 at 12:23:06
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <bitcoin/system.hpp>

// Application includes
#include "alogger.h"
#include "../Bitcoin/abitcoin.h"

// Namespace
using namespace std;
using namespace bc;
using namespace bc::system;


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	ALogger* oLogger = new ALogger(&oEngine);
	oContext->setContextProperty("ALogger",oLogger);

	ABitcoin* oBitcoin = new ABitcoin(&oEngine);
	oContext->setContextProperty("ABitcoin",oBitcoin);
	oContext->setContextProperty("ABitcoinKeys",oBitcoin->pKeys);

	const QUrl oURL(QStringLiteral("qrc:/qml/Main/HDKeys_v1.qml"));
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
