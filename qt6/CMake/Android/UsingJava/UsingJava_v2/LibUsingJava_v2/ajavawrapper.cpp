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
#include "ajavawrapper.h"


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper::AJavaWrapper(QObject* parent) : QObject{parent} {

	pJNIEnvironment = new QJniEnvironment();

	jclass oJavaClass = pJNIEnvironment->findClass(pNameJavaClass);
	if(oJavaClass == NULL) {
		_A_CRITICAL << "AJavaClass class not found";
	} else {
		_A_DEBUG << "AJavaClass class found";
	}

	_A_DEBUG << "AJavaWrapper created";
}


// -----------
/*!
	\fn

	Doc.
*/

AJavaWrapper::~AJavaWrapper(void) {

	_A_DEBUG << "AJavaWrapper deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

int AJavaWrapper::mTest(int inInteger) {

	return QJniObject::callStaticMethod<jint>(
		"systems/arboreus/AJavaPackage/AJavaClass",
		"mTest",
		"(I)I",
		inInteger
	);
}

