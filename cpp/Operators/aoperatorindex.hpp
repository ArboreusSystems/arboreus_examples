// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/02/2020 at 15:32:31
	\endlist
*/
// ----------------------------------------------------------
#ifndef AINDEX_HPP
#define AINDEX_HPP

// System includes
#include <string>

// Application includes

// Constants and defintions

class AOperatorIndex {

	public:

		AOperatorIndex(void);
		~AOperatorIndex(void);

		std::string& operator[](int inIndex);

	private:

		std::string pArray[5];
};


AOperatorIndex::AOperatorIndex(void) {

	pArray[0] = "zero";
	pArray[1] = "one";
	pArray[2] = "two";
	pArray[3] = "three";
	pArray[4] = "four";
}

AOperatorIndex::~AOperatorIndex(void) {}

std::string& AOperatorIndex::operator[](int inIndex) {

	return pArray[inIndex];
}


#endif // AINDEX_HPP
