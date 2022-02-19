/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 16/12/2019 at 07:47:00
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>

// Application includes
#include "aglobal.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"

// Constants


// Qt Quick Application
int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	A_MESSAGE_DEBUG << "Main Thread:" << QThread::currentThreadId();

	AGlobal& oGlobal = AGlobal::mInstance(); Q_UNUSED(oGlobal)

	AObject1* oObject1 = new AObject1(); Q_UNUSED(oObject1)
	AObject2* oObject2 = new AObject2(); Q_UNUSED(oObject2)
	AObject3* oObject3 = new AObject3(); Q_UNUSED(oObject3)

	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
