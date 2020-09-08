/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/09/2020 at 14:19:20
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTest>

// Application includes
//#include "aunittest.h"
#include "atests.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;

	const QUrl oUrl(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oUrl](QObject *oObj, const QUrl &oObjUrl) {
			if (!oObj && oUrl == oObjUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oUrl);

	QTest::qExec(new ATestCase1,inCounter,inArguments);
	QTest::qExec(new ATestCase2,inCounter,inArguments);

	ATests* oTests = new ATests();
	oTests->mRun(inCounter,inArguments);

	return oApplication.exec();

//	QGuiApplication oApplication(inCounter,inArguments);
//	return mUnitTests(inCounter,inArguments);

}
