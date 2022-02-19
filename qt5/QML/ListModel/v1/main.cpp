/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 18:40:39
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include "cpp/todomodel.h"
#include "cpp/todolist.h"

// Constants


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication oApplication(inCounter, inArguments);

	QQmlApplicationEngine oEngine;
	QQmlContext* oRootContext = oEngine.rootContext();

	qmlRegisterType<ToDoModel>("ToDo",1,0,"ToDoModel");
	ToDoList* oToDoList = new ToDoList();
	oRootContext->setContextProperty(QStringLiteral("ToDoList"),oToDoList);

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *oObject, const QUrl &oObjectURL) {
			if (!oObject && oURL == oObjectURL) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
