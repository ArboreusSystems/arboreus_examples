/* -------------------------------------------------------------------
 *  @doc Bsed on https://www.kdab.com/qt-android-episode-5/
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 19/02/2021 at 18:53:04
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>
#include <QDebug>

// Application includes

// Constants

// Functions
int mJavaClassTest(int inNumber) {

	return QAndroidJniObject::callStaticMethod<jint>(
		"systems/arboreus/usingjava_v1/MyJavaClass",
		"mTest",
		"(I)I",
		inNumber
	);
}

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	QAndroidJniEnvironment* oJNIEnvironment = new QAndroidJniEnvironment();
	jclass oMyJavaClass = oJNIEnvironment->findClass("systems/arboreus/usingjava_v1/MyJavaClass");
	if(oMyJavaClass == NULL) {
		qDebug() << "MyJavaClass class not found";
	} else {
		qDebug() << "MyJavaClass class found";
		qDebug() << "MyJavaClass test method result:" << mJavaClassTest(1111);
	}

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
