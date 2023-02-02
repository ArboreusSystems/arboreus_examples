// ----------------------------------------------------------
/*!
	\class AObjectTwo
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 11:01:05
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjecttwo.h"


// -----------
/*!
	\fn

	Doc.
*/

AObjectTwo::AObjectTwo(QObject* parent) : QObject(parent) {

	qDebug() << "AObjectTwo created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectTwo::~AObjectTwo(void) {

	qDebug() << "AObjectTwo deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObjectTwo::mTestMethod(void) {

	qDebug() << "AObjectTwo from test method";
}

