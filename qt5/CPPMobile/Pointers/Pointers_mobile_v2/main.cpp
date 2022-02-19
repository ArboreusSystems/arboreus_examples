/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 25/07/2020 at 12:06:39
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "aobject.h"
#include "alogger.h"

// Constants

// Namespace
using namespace std;


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication oApplication(inCounter, inArguments);

	QQmlApplicationEngine oEngine;
	const QUrl oUrl(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oUrl](QObject *inObject, const QUrl &inObjectURL) {
			if (!inObject && oUrl == inObjectURL) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oUrl);

	AObject* oObject1 = new AObject();
	oObject1->mSetName("oObject1");
	oObject1->mTestMethod();

	{
		unique_ptr<AObject> oObject2(new AObject());
		oObject2->mSetName("oObject2");
		oObject2->mTestMethod();
	}

// -------------------------------
// Do not working in Qt because of C++11

//	{
//		unique_ptr<AObject> oObject3 = make_unique<AObject>();
//		oObject1->mTestMethod();
//	}

	{
		shared_ptr<AObject> oSharedObject;
		{
			shared_ptr<AObject> oObject4 = make_shared<AObject>();
			oObject4->mSetName("oObject4");
			oSharedObject = oObject4;
		}
		oSharedObject->mTestMethod();
	}

	delete oObject1;

	ALOG << "Smart pointers demo - OK";

	return oApplication.exec();
}
