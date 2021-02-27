/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/02/2021 at 11:06:47
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>
#include <QDebug>

// Application includes

// Constants

// Functions
int mJavaModule1Test(int inNumber) {

	return QAndroidJniObject::callStaticMethod<jint>(
		"systems/arboreus/Module1/Module1",
		"mTest",
		"(I)I",
		inNumber
	);
}

int mJavaModule2Test(int inNumber) {

	return QAndroidJniObject::callStaticMethod<jint>(
		"systems/arboreus/Module2/Module2",
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

	jclass oModule1Class = oJNIEnvironment->findClass("systems/arboreus/Module1/Module1");
	if(oModule1Class == NULL) {
		qDebug() << "Module1 class not found";
	} else {
		qDebug() << "Module1 class found";
		qDebug() << "Module1 test method result:" << mJavaModule1Test(1111);
	}

	jclass oModule2Class = oJNIEnvironment->findClass("systems/arboreus/Module2/Module2");
	if(oModule2Class == NULL) {
		qDebug() << "Module2 class not found";
	} else {
		qDebug() << "Module2 class found";
		qDebug() << "Module2 test method result:" << mJavaModule2Test(2222);
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
