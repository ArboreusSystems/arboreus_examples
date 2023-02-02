// ----------------------------------------------------------
/*!
	\class AObjectOne
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 10:32:54
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjectone.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectOne::AObjectOne(QObject* parent) : QObject(parent) {

	qDebug() << "AObjectOne created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectOne::~AObjectOne(void) {

	qDebug() << "AObjectOne deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectOne::mInit(void) {

	pObjectTwo = new AObjectTwo(this);

	qDebug() << "AObjectOne initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectOne::mTest(void) {

	pObjectTwo->mTestMethod();
}

