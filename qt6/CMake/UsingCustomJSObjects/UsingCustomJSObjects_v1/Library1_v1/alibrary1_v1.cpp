/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/08/2025 at 22:04:02
 * */// --------------------------------------------------------------

// Class header
#include "alibrary1_v1.h"


// -----------
/*!
	\fn

	Doc.
*/

ALibrary1_v1::ALibrary1_v1(QObject* parent) : QObject{parent} {

	_A_DEBUG << "ALibrary1_v1 created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALibrary1_v1::~ALibrary1_v1(void) {

	_A_DEBUG << "ALibrary1_v1 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString ALibrary1_v1::mTestString(void) {

	QString oOutput = "ALibrary1_v1 TestString";
	return oOutput;
}

