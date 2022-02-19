// ----------------------------------------------------------
/*!
	\class aLinkedList
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:59:17
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alinkedlist.h"


// -----------
/*!
	\fn

	Doc.
*/

aLinkedList::aLinkedList(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aLinkedList::~aLinkedList(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aLinkedList::mDoTest(void) {

	QLinkedList<QString> oLinkedList1;

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::AlphaLower,
		aDictionaryType::AlphaUpper
	};

	for (int i = 0; i < A_TEST_ITERATIONS_COUNT; ++i) {
		oLinkedList1 << aHandlerMain::mStringRandom(
			aHandlerMain::mNumberRandomFromRange(5,32),
			aHandlerMain::mStringDictionary(oDictionary)
		);
	}

	QLinkedList<QString>::iterator oLinkedListIterator1 = oLinkedList1.begin();
	for (; oLinkedListIterator1 != oLinkedList1.end(); ++oLinkedListIterator1) {
		aLOG << "LinkedList unsorted" << *oLinkedListIterator1;
	}

//	std::sort(oLinkedList1.begin(),oLinkedList1.end(),std::less<int>());

//	QLinkedList<int>::iterator *oLinkedListIterator2 = oLinkedList1.begin();
//	for (; oLinkedListIterator2 != oLinkedList1.end(); ++oLinkedListIterator2) {
//		aLOG << "LinkedList sorted" << *oLinkedListIterator2;
//	}
}
