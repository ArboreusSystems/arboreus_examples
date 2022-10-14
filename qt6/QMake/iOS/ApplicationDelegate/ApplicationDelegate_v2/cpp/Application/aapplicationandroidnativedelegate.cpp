// ----------------------------------------------------------
/*!
	\class AApplicationAndroidNativeDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 14:10:59
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationandroidnativedelegate.h"


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidNativeDelegate::AApplicationAndroidNativeDelegate(QObject *parent) : QObject(parent) {

	_A_DEBUG << "AApplicationAndroidNativeDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidNativeDelegate::~AApplicationAndroidNativeDelegate(void) {

	_A_DEBUG << "AApplicationAndroidNativeDelegate deleted";
}

