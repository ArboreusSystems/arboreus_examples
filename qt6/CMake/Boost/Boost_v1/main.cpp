/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/10/2022 at 16:49:04
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <alogger.h>
#include <aasio.h>



// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	AAsio* oAsio = new AAsio();

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
