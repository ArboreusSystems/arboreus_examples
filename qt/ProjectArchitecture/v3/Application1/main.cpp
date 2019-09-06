/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 03/09/2019 at 20:20:12
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "../UniversalSources/Global/aglobal.h"

// Constants
const QString Main = "qrc:/main.qml";



// QtQuick Application
int main(int Counter, char *Arguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	aLOG << "Application 1";

	aTestClass *oTestClass = new aTestClass();
	aLOG << "Value from oTestClass:" << oTestClass->mTest();

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
