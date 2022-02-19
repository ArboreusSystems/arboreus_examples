/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  Based on:
 *		-- https://forum.qt.io/topic/100810/how-to-modify-data-and-save-to-json-file/3
 *		-- https://stackoverflow.com/questions/21260075/how-to-save-and-load-a-qjsondocument-to-a-file
 *
 *  Change "/path/to/project/demo.json" onto real absolute path to demo.json file from this project
 *  Change "/path/to/project/demo1.json" onto real absolute path to demo.json file from this project
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/12/2019 at 19:59:59
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "aglobal.h"
#include "ahandlerjson.h"

// Constants


// Qt Quick Application
int main(int argc, char *argv[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	AHandlerJSONReply oTestJSONFromFile = AHandlerJSON::mFromFile(
		"/path/to/project/demo.json"
	);

	A_MESSAGE_DEBUG << "oTestJsonFromFile.Status: " << oTestJSONFromFile.Status;
	A_MESSAGE_DEBUG << "oTestJsonFromFile.JsonDocument" << oTestJSONFromFile.JsonDocument;

	QJsonObject oJSONObject = oTestJSONFromFile.JsonDocument.object();
	oJSONObject.insert("testString","changedString");

	A_MESSAGE_DEBUG << "oJSONObject: " << oJSONObject;
	A_MESSAGE_DEBUG << "Write to new file: " << AHandlerJSON::mToFileFromDocument(
		"/path/to/project/demo1.json",
		QJsonDocument(oJSONObject)
	);


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
