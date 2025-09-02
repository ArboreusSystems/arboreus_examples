/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/09/2025 at 09:13:28
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aobjcswiftlibrary.h>
#include <aloggerglobal.h>

// Constants
#define CLIENT_QML_MAIN "qrc:/Main.qml"


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplicationObject(inCounter, inArguments);
	QGuiApplication* oApplication = &oApplicationObject;
	QQmlApplicationEngine oEngineObject;
	QQmlApplicationEngine* oEngine = &oEngineObject;

	AObjCSwiftLibrary* oObjCSwiftLibrary = new AObjCSwiftLibrary(oEngine);
	_A_DEBUG << "ObjC result:" << oObjCSwiftLibrary->mGetText();
	_A_DEBUG << "ObjCSwift result:" << oObjCSwiftLibrary->mGetSwiftText();

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

	int oExecutionResult = oApplication->exec();
	return oExecutionResult;
}
