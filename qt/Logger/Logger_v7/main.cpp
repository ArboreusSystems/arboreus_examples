/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 11/02/2021 at 13:41:56
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "abackend.h"

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	AProperties* oProperties = &AProperties::mInstance();

	ALogger* oLogger = &ALogger::mInstance();
	oLogger->pProperties = oProperties;

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pProperties = oProperties;
	oBackend->pLogger = oLogger;
	oBackend->pGuiApplication = &oApplication;
	oBackend->pEngine = &oEngine;
	oBackend->pRootContext = oEngine.rootContext();
	oBackend->mInit();

	A_CONSOLE_MESSAGE_DEBUG("Debug console message");
	A_CONSOLE_MESSAGE_INFO("Info console message");
	A_CONSOLE_MESSAGE_WARNING("Warning console message");
	A_CONSOLE_MESSAGE_CRITICAL("Critical console message");

	A_LOGGER_DEBUG("Debug message");
	A_LOGGER_INFO("Info message");
	A_LOGGER_WARNING("Warning message");
	A_LOGGER_CRITICAL("Critical message");

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
