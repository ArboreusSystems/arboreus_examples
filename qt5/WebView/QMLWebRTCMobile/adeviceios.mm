// ----------------------------------------------------------
/*!
	\class ADeviceIOS
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/05/2021 at 18:21:25
	\endlist
*/
// ----------------------------------------------------------

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Apple includes
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

// -----------
// IOS part
// -----------


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE
#include "adeviceios.h"


// -----------
/*!
	\fn

	Doc.
*/

ADeviceIOS::ADeviceIOS(QObject* parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceIOS::~ADeviceIOS(void) {}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceEnums::PermissionCamera ADeviceIOS::mDefinePermissionCamera(void) {
	
	__block ADeviceEnums::PermissionCamera oOutput = ADeviceEnums::PermissionCamera::Error;
	
	switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {
		case AVAuthorizationStatusAuthorized: {
			oOutput = ADeviceEnums::PermissionCamera::Granted;
			break;
		}
		case AVAuthorizationStatusNotDetermined: {
			[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
				if (granted) {
					oOutput = ADeviceEnums::PermissionCamera::Granted;
				} else {
					oOutput = ADeviceEnums::PermissionCamera::Denied;
				}
			}];
			break;
		}
		case AVAuthorizationStatusDenied: {
			oOutput = ADeviceEnums::PermissionCamera::Denied;
			break;
		}
		case AVAuthorizationStatusRestricted: {
			oOutput = ADeviceEnums::PermissionCamera::Restricted;
			break;
		}
		default: {
			break;
		}
	}
	
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceEnums::PermissionMicrophone ADeviceIOS::mDefinePermissionMicrophone(void) {
	
	__block ADeviceEnums::PermissionMicrophone oOutput = ADeviceEnums::PermissionMicrophone::Error;
	
	switch ([[AVAudioSession sharedInstance] recordPermission]) {
		case AVAudioSessionRecordPermissionGranted: {
			oOutput = ADeviceEnums::PermissionMicrophone::Granted;
			break;
		}
		case AVAudioSessionRecordPermissionDenied: {
			oOutput = ADeviceEnums::PermissionMicrophone::Denied;
			break;
		}
		case AVAudioSessionRecordPermissionUndetermined: {
			NSLog(@"Microphone Undetermined access");
			[[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted){
				if (granted) {
					oOutput = ADeviceEnums::PermissionMicrophone::Granted;
				} else {
					oOutput = ADeviceEnums::PermissionMicrophone::Denied;
				}
			}];
			break;
		}
		default: {
			break;
		}
	}
	
	return  oOutput;
}

QT_END_NAMESPACE
