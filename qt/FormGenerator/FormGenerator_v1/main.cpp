/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 11/06/2021 at 20:49:36
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>


// Application includes

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

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
