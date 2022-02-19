/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/09/2019 at 21:07:30
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSysInfo>
#include <QSslSocket>

// Application includes
#include "cpp/storage/asqlitestorage.h"
#include "cpp/global/aglobal.h"

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication oApplication(inCounter,inArguments);

	aLOG << "Support SSL: " << QSslSocket::supportsSsl();

	QQmlApplicationEngine oEngine;
	QQmlContext *oRootContext = oEngine.rootContext();

	aSqliteStorage *oStorage = new aSqliteStorage();
	oRootContext->setContextProperty("aSqliteStorage",oStorage);

	oEngine.load(QUrl(Main));
	if (oEngine.rootObjects().isEmpty())
		return -1;

	return oApplication.exec();
}
