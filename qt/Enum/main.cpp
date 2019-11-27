/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 25/11/2019 at 09:45:44
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include <aglobal.h>
#include <enum.h>
#include <ademo.h>

// Constants


// Qt Quick Application
int main(int argc, char *argv[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(argc, argv);
	QQmlApplicationEngine oEngine;
	QQmlContext *Context = oEngine.rootContext();

	qmlRegisterUncreatableType<AEnum1>("AEnum",1,0,"AEnum1","No Enum1");
	qRegisterMetaType<AEnum1::List1>();

	qmlRegisterUncreatableType<AEnum2>("AEnum",1,0,"AEnum2","No Enum2");
	qRegisterMetaType<AEnum2::List2>();

	ADemo *oDemo = new ADemo();
	Context->setContextProperty("ADemo",oDemo);

	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [url](QObject *obj, const QUrl &objUrl) {
			if (!obj && url == objUrl) {
				QCoreApplication::exit(-1);
			}
		},
		Qt::QueuedConnection
	);
	oEngine.load(url);

	return oApplication.exec();
}
