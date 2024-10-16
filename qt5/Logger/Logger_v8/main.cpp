/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 08/03/2021 at 13:08:59
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <abackend.h>

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

	A_CONSOLE_MESSAGE_DEBUG("Test message from main");

	AProperties* oProperties = &AProperties::mInstance();

	ALogger* oLogger = &ALogger::mInstance();
	oLogger->pProperties = oProperties;

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pEngine = &oEngine;
	oBackend->pGuiApplication = &oApplication;
	oBackend->pRootContext = oEngine.rootContext();
	oBackend->pProperties = oProperties;
	oBackend->pLogger = oLogger;
	oBackend->mInit();

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
