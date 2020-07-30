/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/07/2020 at 22:47:19
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPointer>
#include <QSharedPointer>
#include <QWeakPointer>

// Application includes
#include "alogger.h"
#include "aobject.h"

// Constants and definitions
typedef QSharedPointer<AObject> AObjectSharedPointer;

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);

	QQmlApplicationEngine oEngine;
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

	AObject* oObject1 = new AObject("oObject1");
	QPointer<AObject> oPointer1(oObject1);
	ALOG << "oPointer1 object.isNull =" << oPointer1.isNull();
	delete oObject1;
	ALOG << "oPointer1 object.isNull =" << oPointer1.isNull();

	AObject* oObject2 = new AObject("oObject2");
	AObjectSharedPointer oPointer2_1(oObject2);
	AObjectSharedPointer oPointer2_2 = oPointer2_1;
	ALOG << "oPointer2_1.isNull =" << oPointer2_1.isNull();
	ALOG << "oPointer2_2.isNull =" << oPointer2_2.isNull();
//	oPointer2_1->mTestMethod();
//	oPointer2_1->mTestMethod();
	oPointer2_1.clear();
	ALOG << "oPointer2_1.isNull =" << oPointer2_1.isNull();
	ALOG << "oPointer2_2.isNull =" << oPointer2_2.isNull();
//	oPointer2_1->mTestMethod();
//	oPointer2_1->mTestMethod();
	oPointer2_2.clear();
	ALOG << "oPointer2_1.isNull =" << oPointer2_1.isNull();
	ALOG << "oPointer2_2.isNull =" << oPointer2_2.isNull();
//	oPointer2_1->mTestMethod();
//	oPointer2_1->mTestMethod();

	AObject* oObject3 = new AObject("oObject3");
	AObjectSharedPointer oPointer3_1(oObject3);
	QWeakPointer<AObject> oPointer3_2(oPointer3_1);
	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
//	oPointer3_1.clear();
//	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
//	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
	AObjectSharedPointer oPointer3_3 = oPointer3_2.toStrongRef();
	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
	ALOG << "oPointer3_3.isNull =" << oPointer3_3.isNull();
	oPointer3_1.clear();
	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
	ALOG << "oPointer3_3.isNull =" << oPointer3_3.isNull();
	oPointer3_2.clear();
	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
	ALOG << "oPointer3_3.isNull =" << oPointer3_3.isNull();
	oPointer3_3.clear();
	ALOG << "oPointer3_1.isNull =" << oPointer3_1.isNull();
	ALOG << "oPointer3_2.isNull =" << oPointer3_2.isNull();
	ALOG << "oPointer3_3.isNull =" << oPointer3_3.isNull();

	ALOG << "QPointer demo application - OK";

	return oApplication.exec();
}
