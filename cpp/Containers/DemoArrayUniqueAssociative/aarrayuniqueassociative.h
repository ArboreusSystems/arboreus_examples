// ----------------------------------------------------------
/*!
	\headerfile AArrayUniqueAssociative
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/02/2020 at 13:39:03
	\endlist
*/
// ----------------------------------------------------------
#ifndef AARRAYUNIQUEASSOCIATIVE_H
#define AARRAYUNIQUEASSOCIATIVE_H

// System includes
#include <set>
#include <string>

// Application includes
#include "aglobal.h"

// Constants and definitions

// Class definitions
template <class TypeKey,class TypeValue>
class AArrayUniqueAssociative {

	public:

		AArrayUniqueAssociative(void);
		~AArrayUniqueAssociative(void);

		std::size_t mSize(void);

	private:

		typedef struct Element {TypeKey key;TypeValue value;} Element;
		std::set<Element> pArray;
};

// Class body
#include "aarrayuniqueassociative.hpp"

#endif // AARRAYUNIQUEASSOCIATIVE_H
