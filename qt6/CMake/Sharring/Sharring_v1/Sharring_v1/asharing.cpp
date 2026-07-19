// ----------------------------------------------------------
/*!
	\class ASharing
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:22:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asharing.h"


// -----------
/*!
	\fn

	Doc.
*/

ASharing::ASharing(QObject* parent) : QObject{parent} {

#if defined(Q_OS_IOS)
	pNative = new ASharingNativeIOS(this);
#elif defined(Q_OS_ANDROID)
	pNative = new ASharingNativeAndroid(this);
#else
	pNative = new ASharingNative(this);
#endif

	_A_DEBUG << "ASharing created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASharing::~ASharing(void) {

	_A_DEBUG << "ASharing deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASharing::mShareText(const QString& inText) {

	pNative->mShareText(inText);
}

