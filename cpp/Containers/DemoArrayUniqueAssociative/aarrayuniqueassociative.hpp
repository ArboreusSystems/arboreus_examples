// ----------------------------------------------------------
/*!
	\class AArrayUniqueAssociative
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/02/2020 at 13:39:03
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aarrayuniqueassociative.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

template <class TypeKey,class TypeValue>
AArrayUniqueAssociative<TypeKey,TypeValue>::AArrayUniqueAssociative(void) {

	ALOG << "AArrayUniqueAssociative created" << endl;

	std::set<std::string> setOfNumbers;

	// Lets insert four elements
	setOfNumbers.insert("first");
	setOfNumbers.insert("second");
	setOfNumbers.insert("third");
	setOfNumbers.insert("first");

	// Search for element in set using find member function
	std::set<std::string>::iterator it = setOfNumbers.find("second");
	if(it != setOfNumbers.end())
		std::cout<<"'first'  found"<<std::endl;
	else
		std::cout<<"'first' not found"<<std::endl;

	// Search for element in set using find member function
	it = setOfNumbers.find("fourth");
	if(it != setOfNumbers.end())
		std::cout<<"'fourth'  found"<<std::endl;
	else
		std::cout<<"'fourth' not found"<<std::endl;
}


// -----------
/*!
	\fn

	Doc.
*/

template <class TypeKey,class TypeValue>
AArrayUniqueAssociative<TypeKey,TypeValue>::~AArrayUniqueAssociative(void) {

	ALOG << "AArrayUniqueAssociative deleted" << endl;
}

