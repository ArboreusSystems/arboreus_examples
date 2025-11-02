// ----------------------------------------------------------
/*!
	\class AJavaWrapper
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/08/2025 at 23:01:15
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ajavawrapper2.h"


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper2::AJavaWrapper2(QObject* parent) : QObject{parent} {

	pJNIEnvironment = new QJniEnvironment();

	jclass oJavaClass = pJNIEnvironment->findClass(pNameJavaClass);
	if(oJavaClass == NULL) {
		_A_CRITICAL << "AJavaClass2 class not found";
	} else {
		_A_DEBUG << "AJavaClass2 class found";
	}

	_A_DEBUG << "AJavaWrapper2 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper2::~AJavaWrapper2(void) {

	_A_DEBUG << "AJavaWrapper2 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

int AJavaWrapper2::mTest(int inInteger) {

	return QJniObject::callStaticMethod<jint>(
		"systems/arboreus/AJavaPackage2/AJavaClass2",
		"mTest",
		"(I)I",
		inInteger
	);
}

