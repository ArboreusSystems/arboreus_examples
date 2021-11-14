/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/07/2021 at 22:38:59
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QEventLoop>

// Application includes
#include <abackend.h>
#include <athreadobjectcontrollertemplate.h>

// Constants
#define A_MAIN_QML "qrc:/main.qml"

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QGuiApplication* oApplicationReference = &oApplication;

	QQmlApplicationEngine oEngine;
	QQmlApplicationEngine* oEngineReference = &oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();
	const QUrl oURL(QStringLiteral(A_MAIN_QML));

	ABackend* oBackend = &ABackend::mInstance();
	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		oBackend,[oBackend,oApplicationReference,oEngineReference](){
			oBackend->mInit(
				oApplicationReference,
				oEngineReference,
				oEngineReference->rootContext()
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
