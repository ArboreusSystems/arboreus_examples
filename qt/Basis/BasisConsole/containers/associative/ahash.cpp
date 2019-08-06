// ----------------------------------------------------------
/*!
	\class aHash
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:20:35
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ahash.h"


// -----------
/*!
	\fn

	Doc.
*/

aHash::aHash(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aHash::~aHash(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aHash::mDoTest(void) {

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper,
		aDictionaryType::Numeric
	};

	QHash<int,QString> oMap1;
	int oKey = 0; QString oValue = ""; int oIterator = 0;
	while (oIterator < A_TEST_ITERATIONS_COUNT) {
		QRandomGenerator::securelySeeded();
		oKey = QRandomGenerator::global()->generate() % 10;
		if (oMap1.find(oKey) == oMap1.end()) {
			oValue = aHandlerMain::mStringRandom(32,aHandlerMain::mStringDictionary(oDictionary));
			oMap1[oKey] = oValue;
			aLOG << "Key:" << oKey << "Value:" << oValue;
			oIterator++;
		}
	}
}
