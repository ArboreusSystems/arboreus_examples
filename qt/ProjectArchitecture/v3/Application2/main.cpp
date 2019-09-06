/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 03/09/2019 at 20:21:06
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "../UniversalSources/Global/aglobal.h"
#include "../UniversalSources/TestClass/atestclass.h"

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	aLOG << "Application 2";

	aTestClass *oTestClass = new aTestClass();
	aLOG << "Value from oTestClass:" << oTestClass->mTest();

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
