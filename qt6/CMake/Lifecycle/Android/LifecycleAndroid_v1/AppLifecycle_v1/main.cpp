/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/10/2025 at 21:27:25
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>

// Constants
#define CLIENT_QML_MAIN "qrc:/Main.qml"

// Global functions
void handleAppStateChange(Qt::ApplicationState inState) {

	if (inState == Qt::ApplicationActive) {
		_A_DEBUG << "handleAppStateChange Qt::ApplicationActive";
	} else if (inState == Qt::ApplicationInactive) {
		_A_DEBUG << "handleAppStateChange Qt::ApplicationInactive";
	} else if (inState == Qt::ApplicationSuspended) {
		_A_DEBUG << "handleAppStateChange Qt::ApplicationSuspended";
	} else if (inState == Qt::ApplicationHidden) {
		_A_DEBUG << "handleAppStateChange Qt::ApplicationHidden";
	} else {
		_A_DEBUG << "Undefined application state";
	}
}


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplicationObject(inCounter, inArguments);
	QGuiApplication* oApplication = &oApplicationObject;
	_A_DEBUG << "QGuiApplication created";

	QQmlApplicationEngine oEngineObject;
	QQmlApplicationEngine* oEngine = &oEngineObject;
	_A_DEBUG << "QQmlApplicationEngine created";

	qInstallMessageHandler(fLoggerMessageHandler);
	_A_DEBUG << "QT custom logger installed";

	QObject::connect(
		oApplication,&QGuiApplication::applicationStateChanged,
		handleAppStateChange
	);

	_A_DEBUG << "Loading UI";
	const QUrl oURL(QStringLiteral(CLIENT_QML_MAIN));
	QObject::connect(
		oEngine, &QQmlApplicationEngine::objectCreated,
		oApplication, [oURL](QObject* obj, const QUrl& objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine->load(oURL);
	_A_DEBUG << "Loaded UI";

	int oExecutionResult = oApplication->exec();
	_A_DEBUG << "Application will quit";

	return oExecutionResult;
}
