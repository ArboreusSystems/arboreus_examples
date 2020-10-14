/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 14/10/2020 at 19:19:34
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>


// Application includes

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

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
