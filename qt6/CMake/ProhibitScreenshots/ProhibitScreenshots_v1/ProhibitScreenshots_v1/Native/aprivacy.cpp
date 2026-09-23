// ----------------------------------------------------------
/*!
	\class APrivacy
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2026 at 15:01:00
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aprivacy.h"


// -----------
/*!
	\fn

	Doc.
*/

APrivacy::APrivacy(QObject* parent) : QObject(parent) {

	_A_DEBUG << "APrivacy created";
}


// -----------
/*!
	\fn

	Doc.
*/

APrivacy::~APrivacy(void) {

	_A_DEBUG << "APrivacy deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

APrivacy* APrivacy::mInstance(void) {

	static APrivacy oInstance;
	return &oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void APrivacy::mInit(void) {

	fAPrivacy_Init();
	_A_DEBUG << "Privacy hooks initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void APrivacy::mSetAction(bool inAction) {

	fAPrivacy_SetAction(inAction);
}


// -----------
/*!
	\fn

	Doc.
*/

bool APrivacy::mIsScreenRecording(void) const {

	return pIsScreenRecording;
}


// -----------
/*!
	\fn

	Doc.
*/

void APrivacy::mScreenshotTakenHandler(void) {

	_A_DEBUG << "Screenshot event emitted";
	emit sgScreenshotTaken();
}


// -----------
/*!
	\fn

	Doc.
*/

void APrivacy::mScreenRecordingHandler(bool isCaptured) {

	if (pIsScreenRecording != isCaptured) {
		pIsScreenRecording = isCaptured;
		_A_DEBUG << "Screen recording changed:" << isCaptured;
		emit sgScreenRecordingChanged(isCaptured);
	}
}
