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
