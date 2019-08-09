// ----------------------------------------------------------
/*!
	\class aVariant
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 09/08/2019 at 14:03:39
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "avariant.h"





// -----------
/*!
	\fn

	Doc.
*/

aVariant::aVariant(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aVariant::~aVariant(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aVariant::mDoTest(void) {

	QVariant oVariant;

	oVariant = 456;
	aLOG << "QVariant:" << oVariant;

	oVariant = "QString1";
	aLOG << "QVariant:" << oVariant;

	oVariant = QString("QString2");
	aLOG << "QVariant:" << oVariant;
}
