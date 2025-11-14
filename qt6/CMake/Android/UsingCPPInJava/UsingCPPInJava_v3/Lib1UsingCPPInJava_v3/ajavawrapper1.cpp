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
#include "ajavawrapper1.h"


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper1::AJavaWrapper1(QObject* parent) : QObject{parent} {

	pJNIEnvironment = new QJniEnvironment();

	jclass oJavaClass = pJNIEnvironment->findClass(pNameJavaClass);
	if(oJavaClass == NULL) {
		_A_CRITICAL << "AJavaClass1 class not found";
	} else {
		_A_DEBUG << "AJavaClass1 class found";
	}

	_A_DEBUG << "AJavaWrapper1 created";
}


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper1::~AJavaWrapper1(void) {

	_A_DEBUG << "AJavaWrapper1 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

int AJavaWrapper1::mTest(int inInteger) {

	return QJniObject::callStaticMethod<jint>(
		"systems/arboreus/AJavaPackage1/AJavaClass1",
		"mTest",
		"(I)I",
		inInteger
	);
}

