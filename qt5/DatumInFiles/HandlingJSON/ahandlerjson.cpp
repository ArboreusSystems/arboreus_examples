// ----------------------------------------------------------
/*!
	\class AHandlerJSON
	\title
	\brief Template file files/classes/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/12/2019 at 20:00:56
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ahandlerjson.h"


// -----------
/*!
	\fn

	Doc.
*/

AHandlerJSON::AHandlerJSON(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

AHandlerJSON::~AHandlerJSON(void) {}


// -----------
/*!
	\fn

	Doc.
*/

AHandlerJSONReply AHandlerJSON::mFromFile(QString inFile) {

	AHandlerJSONReply oReply = {};

	QFile oJSONFile(inFile);
	if (!oJSONFile.exists()) {
		return oReply;
	}
	oJSONFile.open(QIODevice::ReadOnly|QIODevice::Text);

	QJsonParseError oJSONParseError;
	QJsonDocument oJSONDocument = QJsonDocument::fromJson(
		oJSONFile.readAll(),&oJSONParseError
	);
	if (oJSONDocument.isNull()) {
		return oReply;
	}
	oJSONFile.close();

	oReply.Status = true;
	oReply.JsonDocument = oJSONDocument;
	return oReply;
}


// -----------
/*!
	\fn

	Doc.
*/

bool AHandlerJSON::mToFileFromDocument(QString inFile, QJsonDocument inDocument) {

	QFile oFile(inFile);
	if (!oFile.open(QFile::WriteOnly)) {
		return false;
	}
	if (oFile.write(inDocument.toJson()) >= 0) {
		oFile.close();
		return true;
	}
	return false;
}


// -----------
/*!
	\fn

	Doc.
*/

bool AHandlerJSON::mToFileFromQMap(QString inFile, QVariantMap inData) {

	return mToFileFromDocument(
		inFile, QJsonDocument(QJsonObject::fromVariantMap(inData))
	);
}


// -----------
/*!
	\fn

	Doc.
*/

bool AHandlerJSON::mToFileFromQHash(QString inFile, QVariantHash inData) {

	return mToFileFromDocument(
		inFile,QJsonDocument(QJsonObject::fromVariantHash(inData))
	);
}
