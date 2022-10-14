// ----------------------------------------------------------
/*!
	\class AConfig
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 14:32:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aconfig.h"

// Forwarded classes
#include <abackend.h>


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

void AConfig::AApplicationConfig_mOnQuit(void) {

	_A_DEBUG << "AApplicationConfig_mOnQuit";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnLaunchFinished(void) {

	_A_DEBUG << "AApplicationConfig_mOnLaunchFinished";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnStateUndefined(void) {

	_A_DEBUG << "AApplicationConfig_mOnStateUndefined";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnStateSuspended(void) {

	_A_DEBUG << "AApplicationConfig_mOnStateSuspended";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnStateHidden(void) {

	_A_DEBUG << "AApplicationConfig_mOnStateHidden";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnStateInactive(void) {

	_A_DEBUG << "AApplicationConfig_mOnStateInactive";
}


// -----------
/*!
	\fn

	Doc.
*/

void AConfig::AApplicationConfig_mOnStateActive(void) {

	_A_DEBUG << "AApplicationConfig_mOnStateActive";
}

