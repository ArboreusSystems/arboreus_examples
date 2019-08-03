// ----------------------------------------------------------
/*!
	\class aVector
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:38:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "avector.h"


// -----------
/*!
	\fn

	Doc.
*/

aVector::aVector(QObject *parent) : QObject(parent) {

	pSize = A_TEST_ITERATIONS_COUNT;
}


// -----------
/*!
	\fn

	Doc.
*/

aVector::~aVector(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aVector::mDoTest(void) {

	for (int i = 0; i < pSize; ++i) {
		QRandomGenerator::securelySeeded();
		pVector.append(QRandomGenerator::global()->generate() % 100);
	}

	aLOG << "\n------------------\nTesting QVector\n------------------";
	QVectorIterator<int> oIterator1(pVector);
	while (oIterator1.hasNext()) {
		aLOG << "QVector unsorted value:" << oIterator1.next();
	}

	std::sort(pVector.begin(),pVector.end(),std::less<int>());

	QVectorIterator<int> oIterator2(pVector);
	while (oIterator2.hasNext()) {
		aLOG << "QVector sorted value:" << oIterator2.next();
	}

	QVector<int>::iterator oSTLIteratorForward = pVector.begin();
	for (; oSTLIteratorForward != pVector.end(); ++oSTLIteratorForward) {
		aLOG << "Value by STLIterator forward direction:" << *oSTLIteratorForward;
	}

	QVector<int>::iterator oSTLIteratorBackward = pVector.end();
	for (; oSTLIteratorBackward != pVector.begin();) {
		--oSTLIteratorBackward;
		aLOG << "Value by STLIterator backward direction:" << *oSTLIteratorBackward;
	}

	for (int i = 0; i < pSize; ++i) {
		pVectorObjects.append(new aConTestObject());
	}

	QVector<aConTestObject*>::iterator oOBJIterator1 = pVectorObjects.begin();
	for (; oOBJIterator1 != pVectorObjects.end(); ++oOBJIterator1) {
		aConTestObject *oObject = *oOBJIterator1;
		aLOG << "Unsorted -> Number:" << oObject->pNumber << "String:" << oObject->pString;
	}

	std::sort(pVectorObjects.begin(),pVectorObjects.end());

	QVector<aConTestObject*>::iterator oOBJIterator2 = pVectorObjects.begin();
	for (; oOBJIterator2 != pVectorObjects.end(); ++oOBJIterator2) {
		aConTestObject *oObject = *oOBJIterator2;
		aLOG << "Sorted -> Number:" << oObject->pNumber << "String:" << oObject->pString;
	}
}
