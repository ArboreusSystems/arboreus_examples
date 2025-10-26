/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/10/2025 at 21:45:15
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <aapplicationdelegateglobal.h>

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

	fNativeMacOSDelegateInit();

	QGuiApplication oApplication(inCounter, inArguments);

	_A_DEBUG << "QGuiApplication created";

	QQmlApplicationEngine oEngine;

	_A_DEBUG << "QQmlApplicationEngine created";

	QObject::connect(
		&oApplication,&QGuiApplication::applicationStateChanged,
		handleAppStateChange
	);

	_A_DEBUG << "Loading UI";
	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);
	_A_DEBUG << "Loaded UI";

	int oExecutionResult = oApplication.exec();
	_A_DEBUG << "Application will quit";

	return oExecutionResult;
}
