/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 08/05/2021 at 12:32:25
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include <enumexample.h>
#include <aenumtest.h>
#include <alogger.h>

// Constants

// Namespace
using namespace ARB;


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	ALogger* oLogger = new ALogger(&oEngine);
	oEngine.rootContext()->setContextProperty("ALogger",oLogger);

	AEnumTest* oEnumTest = new AEnumTest(&oEngine);
	oEngine.rootContext()->setContextProperty("AEnumTest",oEnumTest);

	qmlRegisterType<EnumExample>("Arboreus",1,0,"EnumExample");
	qRegisterMetaType<EnumExample::Values>("EnumExample::Values");

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
