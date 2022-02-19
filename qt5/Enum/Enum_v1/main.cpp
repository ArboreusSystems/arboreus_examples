#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <aglobal.h>
#include <aqmlbackend.h>


int main(int inCounter,char* inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	AQMLBackend* oBackend = new AQMLBackend();
	oContext->setContextProperty("Backend",oBackend);

	const QUrl oUrl(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oUrl](QObject *obj, const QUrl &objUrl) {
			if (!obj && oUrl == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oUrl);

	return oApplication.exec();
}
