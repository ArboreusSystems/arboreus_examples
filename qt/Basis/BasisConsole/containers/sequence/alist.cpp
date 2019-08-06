// ----------------------------------------------------------
/*!
	\class aList
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:49:53
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alist.h"


// -----------
/*!
	\fn

	Doc.
*/

aList::aList(QObject *parent) : QObject(parent) {

	pDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper
	};

	for (int i = 0; i < A_TEST_ITERATIONS_COUNT; ++i) {
		pTestList << aHandlerMain::mStringRandom(
			aHandlerMain::mNumberRandomFromRange(5,32),
			aHandlerMain::mStringDictionary(pDictionary)
		);
	}
}


// -----------
/*!
	\fn

	Doc.
*/

aList::~aList(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aList::mDoTest(void) {

	aLOG << "Count:" << pTestList.count();

	QList<QString>::iterator oListIterator1 = pTestList.begin();
	for (; oListIterator1 != pTestList.end(); ++oListIterator1) {
		aLOG << "QList unsorted value:" << *oListIterator1;
	}

	std::sort(pTestList.begin(),pTestList.end(),std::less<QString>());

	QList<QString>::iterator oListIterator2 = pTestList.begin();
	for (; oListIterator2 != pTestList.end(); ++oListIterator2) {
		aLOG << "pTestList sorted std::sort value:" << *oListIterator2;
	}

	QList<QString> oTestList;
	oTestList << "a" << "B" << "A" << "c" << "d" << "E" << "f" << "g" << "1" << "2";

	QList<QString>::iterator oListIterator3 = oTestList.begin();
	for (; oListIterator3 != oTestList.end(); ++oListIterator3) {
		aLOG << "oTestList unsorted:" << *oListIterator3;
	}

	std::sort(oTestList.begin(),oTestList.end(),std::less<QString>());

	QList<QString>::iterator oListIterator4 = oTestList.begin();
	for (; oListIterator4 != oTestList.end(); ++oListIterator4) {
		aLOG << "oTestList sorted by std::sort value:" << *oListIterator4;
	}
}
