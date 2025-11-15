/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 30/08/2025 at 19:09:05
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <Backend/abackend.h>

// Constants
#define CLIENT_QML_MAIN "qrc:/Main.qml"

// Java native callback funcion
Q_DECLARE_JNI_CLASS(AJavaClass1,"systems/arboreus/AJavaPackage1/AJavaClass1")

static jint mAJavaPackage1TestCallBack(JNIEnv* inEnvironment, jobject inObject, jint inNumber) {

	Q_UNUSED(inEnvironment);
	Q_UNUSED(inObject);

	_A_DEBUG << "mAJavaPackage1TestCallBack inNumber =" << inNumber;

	int oCalculatedNumber = QJniObject::callStaticMethod<jint>(
		"systems/arboreus/AJavaPackage2/AJavaClass2",
		"mTest",
		"(I)I",
		inNumber
	);

	_A_DEBUG << "mAJavaPackage1TestCallBack oCalculatedNumber =" << oCalculatedNumber;

	return oCalculatedNumber;
}

Q_DECLARE_JNI_NATIVE_METHOD(mAJavaPackage1TestCallBack)


// Java native callback funcion declaration
Q_DECL_EXPORT jint JNICALL JNI_OnLoad(JavaVM* inJavaVM, void* inReserved) {

	Q_UNUSED(inJavaVM);
	Q_UNUSED(inReserved);

	QJniEnvironment oJNIEnvironment;
	oJNIEnvironment.registerNativeMethods<QtJniTypes::AJavaClass1>({
		Q_JNI_NATIVE_METHOD(mAJavaPackage1TestCallBack)
	});

	return JNI_VERSION_1_6;
}


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplicationObject(inCounter, inArguments);
	QGuiApplication* oApplication = &oApplicationObject;
	QQmlApplicationEngine oEngineObject;
	QQmlApplicationEngine* oEngine = &oEngineObject;

	qInstallMessageHandler(fLoggerMessageHandler);

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->mInit(oApplication,oEngine,oEngine->rootContext());

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
