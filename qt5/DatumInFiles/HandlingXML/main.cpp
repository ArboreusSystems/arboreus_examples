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
#include <QFile>
#include <QIODevice>
#include <QTextStream>

// Application includes
#include "aglobal.h"
#include "ahandlerxml.h"

// Constants


// Qt Quick Application
int main(int argc, char *argv[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	QDomDocument oDomDocument;
	oDomDocument.appendChild(oDomDocument.createProcessingInstruction(
		"xml", "version=\"1.0\" encoding=\"utf-8\""
	));

	QDomElement oRoot = oDomDocument.createElement("books");
	oRoot.setAttribute("id","rootID");
	oDomDocument.appendChild(oRoot);

	QDomElement oItem1 = oDomDocument.createElement("item");
	oItem1.setAttribute("id","item001");
	QDomText oItem1Text = oDomDocument.createTextNode("aaa");
	oItem1.appendChild(oItem1Text);
	oRoot.appendChild(oItem1);
	A_MESSAGE_DEBUG << "Write DOM model to XML file:" << AHandlerXML::mToFile(
		"/path/to/file/test.xml",
		oDomDocument
	);

	AHandlerXMLReply oXMLReadinProcess = AHandlerXML::mFromFile(
		"/path/to/file/test.xml"
	);
	A_MESSAGE_DEBUG << "Read DOM model from XML file:" << oXMLReadinProcess.Status;
	QDomDocument oDomDocumentFromFile = oXMLReadinProcess.DomDocument;
	A_MESSAGE_DEBUG << oDomDocumentFromFile.toString();

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
