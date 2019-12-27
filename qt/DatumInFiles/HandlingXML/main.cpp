/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/12/2019 at 15:48:19
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDomDocument>
#include <QDomElement>

// Application includes
#include "aglobal.h"
#include "ahandlerxml.h"

// Constants


// Qt Quick Application
int main(int argc, char *argv[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	QDomDocument oDomDocument;
	QDomElement oElementRoot = oDomDocument.createElement("root");
	oElementRoot.attribute("testAttribute","attributeValue");
	oDomDocument.appendChild(oElementRoot);

	for(int i = 0; i < 5; i++) {
		QDomElement oElementTest = oDomDocument.createElement("test");
		oElementTest.setAttribute("Value", "number_0" + QString::number(i));
		oElementTest.setAttribute("ID", QString::number(i));
		oElementTest.setNodeValue("Value");
		oElementRoot.appendChild(oElementTest);
	}

	A_MESSAGE_DEBUG << "Write DOM Model to XML file:" << AHandlerXML::mToFile(
		"/Users/alexandr/QtProjects/HandlingXML/test.xml",
		oDomDocument
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
