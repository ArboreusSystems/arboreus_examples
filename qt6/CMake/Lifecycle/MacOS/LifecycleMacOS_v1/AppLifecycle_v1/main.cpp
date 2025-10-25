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
#include <aapplicationdelegateglobal.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	_A_DEBUG << "Main -> Application start";
	fNativeMacOSDelegateInit();

	QGuiApplication oApplication(inCounter, inArguments);
	_A_DEBUG << "Main -> created QGuiApplication";
	QQmlApplicationEngine oEngine;
	_A_DEBUG << "Main -> created QQmlApplicationEngine";

	_A_DEBUG << "Main -> will load QML UI";
	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);
	_A_DEBUG << "Main -> did load QML UI";

	int oExecutionResult = oApplication.exec();
	_A_DEBUG << "Main -> will quit";

	return oExecutionResult;
}
