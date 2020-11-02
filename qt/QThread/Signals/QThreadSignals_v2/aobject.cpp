// ----------------------------------------------------------
/*!
	\class AObject
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/11/2020 at 11:32:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(AObjectHandler* inHandler,QObject *parent) : QObject(parent) {

	pHandler = inHandler;

	QObject::connect(
		this,&AObject::sgTest,
		pHandler,&AObjectHandler::mTest
	);

	ALOG_SYSTEM << "AObject created with handler";
}

// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "AObject created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::~AObject(void) {

	ALOG_SYSTEM << "AObject deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mTest(void) {

	ALOG_SYSTEM << "AObject signal sgTest() emitting from system";
	emit sgTest(1);
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mTestQML(void) {

	ALOG_SYSTEM << "AObject signal sgTest() emitting from QML";
	emit sgTest(3);
}
