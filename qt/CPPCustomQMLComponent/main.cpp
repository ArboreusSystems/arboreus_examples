/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/02/2019 at 10:35:12
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cppcustomqmlcomponent.h"


// Application includes

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	qmlRegisterType<CPPCustomQMLComponent>("Arboreus.examples.cutomQMLComponent",1,0,"CustomComponent");

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
