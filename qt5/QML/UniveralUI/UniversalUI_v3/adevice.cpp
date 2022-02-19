// ----------------------------------------------------------
/*!
	\class ADevice
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:31:52
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adevice.h"


// -----------
/*!
	\fn

	Doc.
*/

ADevice::ADevice(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ADevice created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADevice::~ADevice(void) {

	ALOG_SYSTEM << "ADevice deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceType::Enum ADevice::mType(void) {

	ADeviceType::Enum oOutput = ADeviceType::Enum::Undefined;

#ifdef Q_OS_IOS
	oOutput = ADeviceIOS::mType();
#elif defined(Q_OS_ANDROID)
	oOutput = ADeviceAndroid::mType();
#elif defined(Q_OS_MAC)
	oOutput = ADeviceType::Enum::Desktop;
#else
	oOutput = ADeviceType::Enum::Undefined;
#endif

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceSafeArea ADevice::mSafeArea(void) {

	ADeviceSafeArea oOutput;

#ifdef Q_OS_IOS
	oOutput = ADeviceIOS::mSafeArea();
#elif defined(Q_OS_ANDROID)
	oOutput = ADeviceAndroid::mSafeArea();
#elif defined(Q_OS_MAC)

#else

#endif

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/


void ADevice::mSetStatusBarStyle(ADeviceStatusBarStyle::Enum inStyle) {

#ifdef Q_OS_IOS
	ADeviceIOS::mSetStatusBarStyle(inStyle);
#elif defined(Q_OS_ANDROID)
	ADeviceAndroid::mSetStatusBarStyle(inStyle);
#elif defined(Q_OS_MAC)
	Q_UNUSED(inStyle)
#else
	Q_UNUSED(inStyle)
#endif
}
