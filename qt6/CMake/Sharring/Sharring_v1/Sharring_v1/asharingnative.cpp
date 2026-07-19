// ----------------------------------------------------------
/*!
	\class ASharingNative
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:44:31
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asharingnative.h"


// -----------
/*!
	\fn

	Doc.
*/

ASharingNative::ASharingNative(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ASharingNative created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASharingNative::~ASharingNative(void) {

	_A_DEBUG << "ASharingNative deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASharingNative::mShareText(const QString& inText) {

	_A_DEBUG << "ASharingNative::mSharing";
}

