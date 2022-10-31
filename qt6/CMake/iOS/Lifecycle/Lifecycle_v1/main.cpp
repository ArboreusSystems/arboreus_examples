/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 29/10/2022 at 11:52:01
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <abackend.h>
#include <aconfig.h>
#include <athreadobjectcontrollertemplate.h>

// Constants
#define QML_MAIN "qrc:/main.qml"


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplicationObject(inCounter, inArguments);
	QGuiApplication* oApplication = &oApplicationObject;
	QQmlApplicationEngine oEngineObject;
	QQmlApplicationEngine* oEngine = &oEngineObject;

	qInstallMessageHandler(fLoggerMessageHandler);

	AConfig* oGlobalConfig = new AConfig(oEngine);

	oGlobalConfig->AApplicationConfig_Lifecycle_WillLaunchBackend();

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	ABackend* oBackend = &ABackend::mInstance();
	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		oBackend,[oBackend,oApplication,oEngine,oGlobalConfig](){
			oBackend->mInit(
				oApplication,oEngine,
				oEngine->rootContext(),
				static_cast<QObject*>(oGlobalConfig)
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

	oGlobalConfig->mSetBackend(oBackend);
	oGlobalConfig->AApplicationConfig_Lifecycle_DidLaunchBackend();

	oGlobalConfig->AApplicationConfig_Lifecycle_WillLaunchUI();
	const QUrl oURL(QStringLiteral(QML_MAIN));
	QObject::connect(
		oEngine, &QQmlApplicationEngine::objectCreated,
		oApplication, [oURL](QObject* obj, const QUrl& objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine->load(oURL);
	oGlobalConfig->AApplicationConfig_Lifecycle_DidLaunchUI();

	int oExecutionResult = oApplication->exec();
	oGlobalConfig->AApplicationConfig_Lifecycle_WillQuit();

	return oExecutionResult;
}
