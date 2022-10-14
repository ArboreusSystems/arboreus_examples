/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 24/07/2022 at 17:32:12
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <aloggerglobal.h>

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	qInstallMessageHandler(fLoggerMessageHandler);

	_A_DEBUG << "Launch Arguments Counter:" << inCounter;
	for (int i = 0; i < inCounter; i++) {
		_A_DEBUG << "Launch Argument" << i << ":" << inArguments[i];
	}

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QObject::connect(
		&oApplication,&QGuiApplication::applicationStateChanged,
		&oApplication,[](Qt::ApplicationState inState){
			_A_DEBUG << \
				"QGUI Application state changed:" << \
				QMetaEnum::fromType<Qt::ApplicationState>().valueToKey(inState);
		}
	);

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject* obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
