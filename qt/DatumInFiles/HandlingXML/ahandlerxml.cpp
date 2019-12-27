// ----------------------------------------------------------
/*!
	\class AHandlerXML
	\title
	\brief Template file files/classes/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2019 at 15:54:04
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ahandlerxml.h"


// -----------
/*!
	\fn

	Doc.
*/

AHandlerXML::AHandlerXML(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

AHandlerXML::~AHandlerXML(void) {}


// -----------
/*!
	\fn

	Doc.
*/

bool AHandlerXML::mToFile(QString inFile, QDomDocument inDom) {

	QFile oXMLFile(inFile);
	if (oXMLFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
		QTextStream oXMLStream(&oXMLFile);
		oXMLStream << inDom.toString();
		oXMLFile.close();
		return true;
	}

	return false;
}
