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
#include "iosappstate.h"

// Global variables
IOSAppState* IOSAppState::m_delegate = nullptr;


// -----------
/*!
	\fn

	Doc.
*/

IOSAppState::IOSAppState(QObject* parent) : QObject(parent) {

	_A_DEBUG << "IOSAppState created";
}


// -----------
/*!
	\fn

	Doc.
*/

IOSAppState::~IOSAppState(void) {

	_A_DEBUG << "IOSAppState deleted";
}

// -----------
/*!
	\fn

	Doc.
*/

IOSAppState* IOSAppState::getInstance(void) {

	if (nullptr == m_delegate) m_delegate = new IOSAppState();
	return m_delegate;
}


// -----------
/*!
	\fn

	Doc.
*/

void IOSAppState::destroyInstance(void) {

	 if (m_delegate) {
		delete m_delegate;
		m_delegate = nullptr;
	 }
}


// -----------
/*!
	\fn

	Doc.
*/

void IOSAppState::applicationDidEnterBackGround(void) {

	_A_DEBUG << "applicationDidEnterBackGround";
}


// -----------
/*!
	\fn

	Doc.
*/

void IOSAppState::applicationDidEnterForeGround(void) {

	_A_DEBUG << "applicationDidEnterForeGround";
}


// -----------
/*!
	\fn

	Doc.
*/

void IOSAppState::applicationDidBecomeActive(void) {

	_A_DEBUG << "applicationDidBecomeActive";
}

