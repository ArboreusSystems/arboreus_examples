// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/07/2020 at 05:37:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::AGlobal(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mPrintValue(string inName,void* inPointer, ADataType inType) {

	switch (inType) {
		case ADataType::Integer:
			ALOG << inName << ": " << *static_cast<int*>(inPointer) << endl;
			break;
		case ADataType::Float:
			ALOG << inName << ": " << *static_cast<float*>(inPointer) << endl;
			break;
		case ADataType::Char:
			ALOG << inName << ": " << static_cast<char*>(inPointer) << endl;
			break;
		default:
			break;
	}
}
