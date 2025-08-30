/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/08/2025 at 21:58:38
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <Backend/abackend.h>
#include <Logger/aloggerglobal.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplicationObject(inCounter, inArguments);
	QGuiApplication* oApplication = &oApplicationObject;

	QQmlApplicationEngine oEngineObject;
	QQmlApplicationEngine* oEngine = &oEngineObject;

	qInstallMessageHandler(fLoggerMessageHandler);

	ABackend* oBackend = new ABackend(oEngine);
	Q_UNUSED(oBackend);

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		oEngine, &QQmlApplicationEngine::objectCreationFailed,
		oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngineObject.load(oURL);

	return oApplicationObject.exec();
}
