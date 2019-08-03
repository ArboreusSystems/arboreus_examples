// ----------------------------------------------------------
/*!
	\class aConTestObject
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 03/08/2019 at 11:45:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acontestobject.h"


// -----------
/*!
	\fn

	Doc.
*/

aConTestObject::aConTestObject(QObject *parent) : QObject(parent) {

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper,
		aDictionaryType::Numeric
	};
	QRandomGenerator::securelySeeded();
	pString = aHandlerMain::mStringRandom(
		10 + QRandomGenerator::global()->generate() % 15,
		aHandlerMain::mStringDictionary(oDictionary)
	);
	QRandomGenerator::securelySeeded();
	pNumber = QRandomGenerator::global()->generate() % 10000;
}


// -----------
/*!
	\fn

	Doc.
*/

aConTestObject::~aConTestObject(void) {}
