// ----------------------------------------------------------
/*!
	\class AApplicationAndroidDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:43:20
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationandroiddelegate.h"


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidDelegate::AApplicationAndroidDelegate(QObject* parent) : AApplicationDelegate(parent) {

	_A_DEBUG << "AApplicationAndroidDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplicationAndroidDelegate::~AApplicationAndroidDelegate(void) {

	_A_DEBUG << "AApplicationAndroidDelegate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnQuit(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AApplicationAndroidDelegate::mOnLaunchFinished(void) {

}




