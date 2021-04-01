/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 01/04/2021 at 12:06:50
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <abackend.h>
#include <adownloadmanager.h>

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	ABackend* oBackend = &ABackend::mInstance();
	AProperties oProperties; oBackend->pProperties = &oProperties;
	ALogger oLogger; oBackend->pLogger = &oLogger;

	oBackend->mInit();

	ADownloadManager oDownloadManager;
	oDownloadManager.mDownload("https://instatscout.com/images/teams/180/3.png");

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
