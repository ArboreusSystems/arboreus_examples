/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 09/02/2021 at 17:51:01
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

//	A_CONSOLE_DEBUG("Debug message");
//	A_CONSOLE_INFO("Info message");
//	A_CONSOLE_WARNING("Warning message");
//	A_CONSOLE_CRITICAL("Critical message");

	qDebug() << "Initial message";

	AProperties* oProperties = &AProperties::mInstance();

	ALogger* oLogger = &ALogger::mInstance(oProperties);
	qInstallMessageHandler(ALogger::mWriteToLog);

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->pGuiApplication = &oApplication;
	oBackend->pEngine = &oEngine;
	oBackend->pRootContext = oEngine.rootContext();
	oBackend->pProperties = oProperties;
	oBackend->pLogger = oLogger;
	oBackend->mInit();

	qDebug() << "Debug from main";
	qInfo() << "Info from main";
	qWarning() << "Warning from main";
	qCritical() << "Debug from main";

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
