/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 25/07/2020 at 12:44:56
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QVector>

// Application includes
#include "alogger.h"
#include "aglobal.h"

// Constants

// Namespace
using namespace std;

// Functions
void fFunction(void) {

	ALOG << "mFunction";
}

void fForEach(QVector<int>& inValues, void (*inCallback)(int)) {

	for (int iValue:inValues) {
		inCallback(iValue);
	}
}

void fValueCallBack(int inValue) {

	ALOG << "Value from callback function:" << inValue;
}


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

	auto oFunction1 = fFunction;
	oFunction1();

	AGlobal* oGlobal = new AGlobal();

	typedef void (AGlobal::*oFunctionViaPointer)();
	oFunctionViaPointer oFunction2 = &AGlobal::mTestMethod;
	(oGlobal->*oFunction2)();

	typedef void (AGlobal::*oFunctionViaPointerWithParameters)(const char*);
	oFunctionViaPointerWithParameters oFunction3 = &AGlobal::mTestMethodWithParameter;
	(oGlobal->*oFunction3)("string from main");

	auto oFunction4 = AGlobal::mTestStaticMethod;
	oFunction4();

	void (*oFunction5)() = fFunction;
	oFunction5();

	QVector<int> oVector = {1,2,3,4,5,6,7,8,9};
	fForEach(oVector,fValueCallBack);

	ALOG << "Function pointers - OK";

	return oApplication.exec();
}

