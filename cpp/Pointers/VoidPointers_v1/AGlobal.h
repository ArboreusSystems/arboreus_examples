// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 10/07/2021 at 10:13:30
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes

// Application includes

// Constants and defintions
#define A_UNUSED(inVariable) (void)inVariable;

// Namespace
using namespace std;


enum ATypes: int {

	Integer,
	Char,
	Boolean
};

#endif // AGLOBAL_H
