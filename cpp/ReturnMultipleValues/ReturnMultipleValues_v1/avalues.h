// ----------------------------------------------------------
/*!
	\headerfile AValues
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 13:48:07
	\endlist
*/
// ----------------------------------------------------------
#ifndef AVALUES_H
#define AVALUES_H

// System includes
#include <iostream>
#include <string>
#include <tuple>
#include <unordered_map>

// Application includes

// Constants and definitions

// Namespace
using namespace std;


// Class definitions
class AValues {

	public:

		AValues(void);
		~AValues(void);

		pair<string,int> mReturnPair(void);
		tuple<int,int,string,float,string,double> mReturnTuple(void);
		unordered_map<string,int> mReturnUnorderedMap(void);
};

#endif // AVALUES_H
