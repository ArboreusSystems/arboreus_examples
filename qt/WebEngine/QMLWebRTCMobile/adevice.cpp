// ----------------------------------------------------------
/*!
	\class ADevice
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/05/2021 at 17:40:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adevice.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ADevice::ADevice(QObject *parent) : QObject(parent) {

	ALOG << "ADevice created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADevice::~ADevice(void) {

	ALOG << "ADevice deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::mInit(void) {

	pBackend = &ABackend::mInstance();

	this->mDefinePermissionCamera();
	this->mDefinePermissionMicrophone();

	ALOG << "ADevice initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::mDefinePermissionCamera(void) {

#ifdef Q_OS_IOS
	pPermissionCamera = ADeviceIOS::mDefinePermissionCamera();
#elif defined(Q_OS_ANDROID)
	pPermissionCamera = ADeviceAndroid::mDefinePermissionCamera();
#elif defined(Q_OS_MAC)

#else

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::mDefinePermissionMicrophone(void) {

#ifdef Q_OS_IOS
	pPermissionMicrophone = ADeviceIOS::mDefinePermissionMicrophone();
#elif defined(Q_OS_ANDROID)
	pPermissionMicrophone = ADeviceAndroid::mDefinePermissionMicrophone();
#elif defined(Q_OS_MAC)

#else

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceEnums::PermissionCamera ADevice::mPermissionCamera(void) {

	return pPermissionCamera;
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceEnums::PermissionMicrophone ADevice::mPermissionMicrophone(void) {

	return pPermissionMicrophone;
}

