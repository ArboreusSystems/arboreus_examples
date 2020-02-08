// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2020 at 13:03:34
	\endlist
*/
// ----------------------------------------------------------
#ifndef AARRAYASSOCIATIVE_H
#define AARRAYASSOCIATIVE_H

// System includes
#include <iostream>
#include <vector>
#include <string>

// Application includes
#include "aglobal.h"

// Constants and defintions

using namespace std;


template <class TypeKey,class TypeValue>
class AArrayAssociative {

	private:

		typedef struct Element {TypeKey key;TypeValue value;} Element;
		std::vector<Element> pArray;

	public:

		void mErase(void) {

			pArray.clear();
		}

		long mSize(void) {

			return pArray.size();
		}

		bool mIsKey(TypeKey inKey) {

			for (long i = 0; i < mSize(); i++) {
				if (pArray[i].key == inKey) {return true;}
			}
			return false;
		}

		bool mAdd(TypeKey inKey,TypeValue inValue) {

			if (mIsKey(inKey)) {return  false;}
			Element oElement;
			oElement.key = inKey;
			oElement.value = inValue;
			pArray.push_back(oElement);
			return true;
		}

		TypeValue& operator[](TypeKey inKey) {

			for (long i = 0; i < mSize(); i++) {
				if (pArray[i].key == inKey) {return pArray[i].value;}
			}
			long oIndex = mSize();
			Element oElement;
			oElement.key = inKey;
			pArray.push_back(oElement);
			return pArray[oIndex].value;
		}

		TypeKey mKey(long inIndex) {

			if (inIndex < 0) {return pArray[0].key;}
			if (inIndex >= mSize()) {return NULL;}
			return pArray[inIndex].key;
		}

		TypeValue& operator[](long inIndex) {

			if (inIndex < 0) {return pArray[0].value;}
			if (inIndex >= mSize()) {return NULL;}
			return pArray[inIndex].value;
		}
};


#endif // AARRAYASSOCIATIVE_H
