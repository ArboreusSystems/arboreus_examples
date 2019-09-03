/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 21/08/2019 at 13:10:52
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "../Libs/macos/backend.h"

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	Backend *oBackend = new Backend();
	oBackend->mTestMethod();

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
