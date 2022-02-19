/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 16/09/2020 at 17:10:28
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QMetaObject>
#include <QQmlContext>
#include <QVariant>

// Application includes
#include "acustomtype1.h"
#include "alogger.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext *oContext = oEngine.rootContext();

	ALogger* oLogger = new ALogger();
	oContext->setContextProperty("ALogger",oLogger);

	qmlRegisterType<ACustomType1>("Custom",1,0,"ACustomType1");

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

	QObject* oCustomType1 = oEngine.rootObjects().first()->findChild<QObject*>("oCustomType1_1");
	QMetaObject::invokeMethod(oCustomType1,"mTestJSFunction");

	QObject* oCustomType2 = oEngine.rootObjects().first()->findChild<QObject*>("oCustomType1_2");
	if (!QMetaObject::invokeMethod(oCustomType2,"mTestJSFunction")) {
		ALOG_SYSTEM << "No JS method: mTestJSFunction";
	}

	QVariant oReturnValue("no_value");
	if (QMetaObject::invokeMethod(oCustomType2,"mReturnValue",Q_RETURN_ARG(QVariant,oReturnValue))) {
		ALOG_SYSTEM << "oReturnValue:" << qvariant_cast<int>(oReturnValue);
	} else {
		ALOG_SYSTEM << "No JS method: mReturnValue";
	}

	QObject* oCustomType3 = oEngine.rootObjects().first()->findChild<QObject*>("oCustomType1_3");
	if (!oCustomType3) {
		ALOG_SYSTEM << "No QML object";
	}

	return oApplication.exec();
}
