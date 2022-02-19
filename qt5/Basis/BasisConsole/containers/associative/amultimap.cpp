// ----------------------------------------------------------
/*!
	\class aMultiMap
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:17:21
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amultimap.h"


// -----------
/*!
	\fn

	Doc.
*/

aMultiMap::aMultiMap(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aMultiMap::~aMultiMap(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aMultiMap::mDoTest(void) {

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper,
		aDictionaryType::Numeric
	};

	QMultiMap<int,QString> oMultiMap;
	int i = 0;
	while (i < A_TEST_ITERATIONS_COUNT) {
		QRandomGenerator::securelySeeded();
		oMultiMap.insert(
			QRandomGenerator::global()->generate() % 10,
			aHandlerMain::mStringRandom(32,aHandlerMain::mStringDictionary(oDictionary))
		);
		i++;
	}

	QMultiMap<int,QString>::iterator oIterator = oMultiMap.begin();
	for (; oIterator != oMultiMap.end(); ++oIterator) {
		aLOG << "Key:" << oIterator.key() << "Value:" << oIterator.value();
	}

	QMultiMap<int,QString>::iterator oIteratorSelection = oMultiMap.find(3);
	for (; oIteratorSelection != oMultiMap.end() && oIteratorSelection.key() == 3; ++oIteratorSelection) {
		aLOG << "Selected by Key:" << oIteratorSelection.key() << "Value:" << oIteratorSelection.value();
	}
}
