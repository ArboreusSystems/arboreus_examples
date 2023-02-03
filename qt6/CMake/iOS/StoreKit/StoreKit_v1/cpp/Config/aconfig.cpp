// ----------------------------------------------------------
/*!
	\class AConfig
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/01/2023 at 16:47:05
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aconfig.h"


// -----------
/*!
	\fn

	Doc.
*/

AConfig::AConfig(QObject* parent) : QObject(parent) {

	_A_DEBUG << "AConfig created";
}


// -----------
/*!
	\fn

	Doc.
*/

AConfig::~AConfig(void) {

	_A_DEBUG << "AConfig deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::mInit(void) {

	_A_DEBUG << "AConfig initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::mStorekitConfigInterface_ProducIDs(QString inID) {

}

