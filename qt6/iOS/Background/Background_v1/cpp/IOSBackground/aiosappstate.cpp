// ----------------------------------------------------------
/*!
	\class IOSAppState
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/04/2022 at 08:29:57
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aiosappstate.h"

// Global variables
AIOSAppState* AIOSAppState::pDelegate = nullptr;


// -----------
/*!
	\fn

	Doc.
*/

AIOSAppState::AIOSAppState(QObject* parent) : QObject(parent) {

	_A_DEBUG << "IOSAppState created";
}


// -----------
/*!
	\fn

	Doc.
*/

AIOSAppState::~AIOSAppState(void) {

	_A_DEBUG << "IOSAppState deleted";
}

// -----------
/*!
	\fn

	Doc.
*/

AIOSAppState* AIOSAppState::mGetInstance(void) {

    if (nullptr == pDelegate) pDelegate = new AIOSAppState();
    return pDelegate;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIOSAppState::mDestroyInstance(void) {

     if (pDelegate) {
        delete pDelegate;
        pDelegate = nullptr;
	 }
}


// -----------
/*!
	\fn

	Doc.
*/

void AIOSAppState::mApplicationDidEnterBackGround(void) {

    _A_DEBUG << "mApplicationDidEnterBackGround";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIOSAppState::mApplicationDidEnterForeGround(void) {

    _A_DEBUG << "mApplicationDidEnterForeGround";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIOSAppState::mApplicationDidBecomeActive(void) {

    _A_DEBUG << "mApplicationDidBecomeActive";
}

