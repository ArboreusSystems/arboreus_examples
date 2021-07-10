// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 10/07/2021 at 10:47:53
	\endlist
*/
// ----------------------------------------------------------
#ifndef AFUNCTIONS_H
#define AFUNCTIONS_H

// System includes
#include <iostream>

// Application includes
#include <aglobal.h>

// Constants and defintions

// Namespace
using namespace std;


int fSum(int inFirst,int inSecond) {

	if (inFirst == inSecond) return inFirst;
	return inFirst + fSum(inFirst + 1, inSecond);
}

#endif // AFUNCTIONS_H
