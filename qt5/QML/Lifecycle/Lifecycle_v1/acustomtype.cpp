// ----------------------------------------------------------
/*!
	\class ACustomType
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/09/2020 at 20:33:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acustomtype.h"


// -----------
/*!
	\fn

	Doc.
*/

ACustomType::ACustomType(QObject* parent) : QObject(parent) {

	pGlobal = &AGlobal::mInstance();
	ALOG_SYSTEM << this->objectName() << "ACustomType created";
}


// -----------
/*!
	\fn

	Doc.
*/

ACustomType::~ACustomType(void) {

	ALOG_SYSTEM << this->objectName() << "ACustomType deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mInit(void) {

	ALOG_SYSTEM << this->objectName() << "Init procedures performed";
}



// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mAction(void) {

	mActionStep1();
	mActionStep2();
	mActionStep3();
	ALOG_SYSTEM << this->objectName() << "Action performed";
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mActionStep1(void) {

	if (!QMetaObject::invokeMethod(this,"onStep1")) {
		ALOG_SYSTEM << this->objectName() << "No JS method for onStep1, running default";
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mActionStep2(void) {

	if (!QMetaObject::invokeMethod(this,"onStep2")) {
		ALOG_SYSTEM << this->objectName() << "No JS method for onStep3, running default";
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ACustomType::mActionStep3(void) {

	if (!QMetaObject::invokeMethod(this,"onStep3")) {
		ALOG_SYSTEM << this->objectName() << "No JS method for onStep3, running default";
	}
}
