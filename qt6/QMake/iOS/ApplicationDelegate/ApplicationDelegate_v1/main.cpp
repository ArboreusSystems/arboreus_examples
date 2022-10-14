/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 06/06/2022 at 11:13:08
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QEventLoop>

// Application includes
#include <abackend.h>
#include <athreadobjectcontrollertemplate.h>

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	QEventLoop* oEventLoop = new QEventLoop();
	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();

	ABackend* oBackend = &ABackend::mInstance();
	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		oBackend,[oBackend,&oApplication,&oEngine](){
			oBackend->mInit(
				&oApplication,&oEngine,oEngine.rootContext()
			);
		}
	);
	QObject::connect(
		oBackend,&ABackend::sgInitiated,
		oEventLoop,&QEventLoop::quit
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(oBackend,nullptr,oEventLoop,nullptr);
	delete oController;
	delete oEventLoop;

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
