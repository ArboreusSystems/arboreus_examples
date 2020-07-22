// ----------------------------------------------------------
/*!
	\class AValues
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 13:48:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "avalues.h"


// -----------
/*!
	\fn

	Doc.
*/

AValues::AValues(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

AValues::~AValues(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

pair<string,int> AValues::mReturnPair(void) {

	return make_pair("Pair string value",100);
}


// -----------
/*!
	\fn

	Doc.
*/

tuple<int,int,string,float,string,double> AValues::mReturnTuple(void) {

	return make_tuple(1,2,"three",4.0f,"five",6.0f);
}


// -----------
/*!
	\fn

	Doc.
*/

unordered_map<string,int> AValues::mReturnUnorderedMap(void) {

	unordered_map<string,int> oOutput;
	oOutput["one"] = 1;
	oOutput["two"] = 2;
	oOutput["three"] = 3;
	return oOutput;
}
