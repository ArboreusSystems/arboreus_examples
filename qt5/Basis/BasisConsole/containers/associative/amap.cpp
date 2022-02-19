// ----------------------------------------------------------
/*!
	\class aMap
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:15:08
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amap.h"


// -----------
/*!
	\fn

	Doc.
*/

aMap::aMap(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aMap::~aMap(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aMap::mDoTest(void) {

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper,
		aDictionaryType::Numeric
	};

	QMap<int,QString> oMap1;
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
