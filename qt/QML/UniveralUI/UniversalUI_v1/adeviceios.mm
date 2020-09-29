// ----------------------------------------------------------
/*!
	\class ADeviceIOS
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


// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Apple includes
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


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

ADeviceIOS::ADeviceIOS(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ADeviceIOS created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceIOS::~ADeviceIOS(void) {

	ALOG_SYSTEM << "ADeviceIOS deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ADeviceType::Enum ADeviceIOS::mType(void) {

	ADeviceType::Enum oOutput = ADeviceType::Enum::Undefined;
	switch ([[UIDevice currentDevice] userInterfaceIdiom]) {
		case UIUserInterfaceIdiomPad:
			oOutput = ADeviceType::Enum::Tablet;
			break;
		case UIUserInterfaceIdiomPhone:
			oOutput = ADeviceType::Enum::Phone;
			break;
		default: break;
	}
	return oOutput;
}

QT_END_NAMESPACE
