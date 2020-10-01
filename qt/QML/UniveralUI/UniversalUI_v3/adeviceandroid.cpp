// ----------------------------------------------------------
/*!
	\class ADeviceAndroid
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 13:25:05
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adeviceandroid.h"


// -----------
/*!
	\fn

	Doc.
*/

ADeviceAndroid::ADeviceAndroid(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceAndroid::~ADeviceAndroid(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceType::Enum ADeviceAndroid::mType(void) {

	// TODO: ANDROID -> Develop device type detection

	return ADeviceType::Enum::Phone;
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceSafeArea ADeviceAndroid::mSafeArea(void) {

	ADeviceSafeArea oOutput;

	// TODO: ANDROID -> Develop safe area handler

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void ADeviceAndroid::mSetStatusBarStyle(ADeviceStatusBarStyle::Enum inStyle) {

	Q_UNUSED(inStyle);

	// TODO: ANDROID -> Develop status bar style definition
}
