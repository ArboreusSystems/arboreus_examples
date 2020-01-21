// ----------------------------------------------------------
/*!
	\class AQueue
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/01/2020 at 20:52:27
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aqueue.h"

using namespace std;

// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
AQueue<Type>::AQueue(void) {

	ALOG << "AQueue created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
AQueue<Type>::~AQueue(void) {

	ALOG << "AQueue deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
Type AQueue<Type>::mGet(void) {

	Type oElement = pStorage.back();
	pStorage.pop_back();
	return oElement;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
std::vector<Type> AQueue<Type>::mGetAll(void) {

	return pStorage;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
void AQueue<Type>::mPut(Type inElement) {

	pStorage.insert(pStorage.begin(),inElement);
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
int AQueue<Type>::mSize(void) {

	return static_cast<int>(pStorage.size());
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
bool AQueue<Type>::mIsEmpty(void) {

	if (static_cast<int>(pStorage.size()) == 0) {
		return true;
	}
	return false;
}
