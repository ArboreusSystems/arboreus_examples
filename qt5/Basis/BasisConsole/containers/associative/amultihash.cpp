// ----------------------------------------------------------
/*!
	\class aMultiHash
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:24:14
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amultihash.h"


// -----------
/*!
	\fn

	Doc.
*/

aMultiHash::aMultiHash(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aMultiHash::~aMultiHash(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aMultiHash::mDoTest(void) {

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper,
		aDictionaryType::Numeric
	};

	QMultiHash<int,QString> oMultiHash;
	int i = 0;
	while (i < A_TEST_ITERATIONS_COUNT) {
		QRandomGenerator::securelySeeded();
		oMultiHash.insert(
			QRandomGenerator::global()->generate() % 10,
			aHandlerMain::mStringRandom(32,aHandlerMain::mStringDictionary(oDictionary))
		);
		i++;
	}

	QMultiHash<int,QString>::iterator oIterator = oMultiHash.begin();
	for (; oIterator != oMultiHash.end(); ++oIterator) {
		aLOG << "Key:" << oIterator.key() << "Value:" << oIterator.value();
	}

	QMultiHash<int,QString>::iterator oIteratorSelection = oMultiHash.find(3);
	for (; oIteratorSelection != oMultiHash.end() && oIteratorSelection.key() == 3; ++oIteratorSelection) {
		aLOG << "Selected by Key:" << oIteratorSelection.key() << "Value:" << oIteratorSelection.value();
	}
}
