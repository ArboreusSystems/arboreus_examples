// ----------------------------------------------------------
/*!
	\class ADeque
    \title
    \brief Template file files/cppheader/file.h

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 29/01/2020 at 15:06:44
    \endlist
*/
// ----------------------------------------------------------

// Class header
#include "adeque.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
ADeque<Type>::ADeque(void) {

	ALOG << "ADeque created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
ADeque<Type>::~ADeque(void) {

	ALOG << "ADeque deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
bool ADeque<Type>::mIsEmpty(void) {

	if (pStorage.size() > 0) {
		return false;
	}
	return true;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
int ADeque<Type>::mSize(void) {

	return static_cast<int>(pStorage.size());
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
void ADeque<Type>::mPutToBegin(Type inElement) {

	pStorage.insert(pStorage.begin(),inElement);
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
void ADeque<Type>::mPutToEnd(Type inElement) {

	pStorage.insert(pStorage.end(),inElement);
}


// -----------
/*!
	\fn

	Doc.
*/

template <class Type>
Type ADeque<Type>::mGet(void) {

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
std::deque<Type> ADeque<Type>::mGetAll(void) {

	return pStorage;
}













