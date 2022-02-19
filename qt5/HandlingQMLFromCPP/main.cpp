/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 30/08/2019 at 13:17:07
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlProperty>
#include <QQmlComponent>
#include <QQuickItem>
#include <QMetaObject>

// Application includes
#include "aglobal.h"

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty()) {
		return -1;
	}

	QObject *oRootObject = dynamic_cast<QObject*>(Engine.rootObjects()[0]);
	QObject *oJSWrapper = oRootObject->findChild<QObject*>("jsWrapper");

	if (oJSWrapper) {

		QMetaObject::invokeMethod(oJSWrapper,"mCreateComponents");

//		QQmlComponent oComponentButtonExit(&Engine,QUrl(QString("qrc:/ButtonExit.qml")));
//		QQuickItem *oItemButtonExit = dynamic_cast<QQuickItem*>(oComponentButtonExit.beginCreate(Engine.rootContext()));
//		oItemButtonExit->setParentItem(dynamic_cast<QQuickItem*>(oBottomBlock));
//		oItemButtonExit->setParent(oBottomBlock);
//		oComponentButtonExit.completeCreate();

//		QQmlComponent oComponentPaddingBottom(&Engine,QUrl(QString("qrc:/PaddingItem.qml")));
//		QQuickItem *oItemPaddingBottom = dynamic_cast<QQuickItem*>(oComponentPaddingBottom.beginCreate(Engine.rootContext()));
//		oItemPaddingBottom->setParentItem(dynamic_cast<QQuickItem*>(oBottomBlock));
//		oItemPaddingBottom->setParent(oBottomBlock);
//		oItemPaddingBottom->setProperty("height",30);
//		oComponentPaddingBottom.completeCreate();

//		aLOG << oBottomBlock;
//		aLOG << oBottomBlock->children();
	}

	return Application.exec();
}
