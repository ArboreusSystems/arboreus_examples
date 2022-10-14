// ----------------------------------------------------------
/*!
	\class ANotificationsIOSDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:15:16
	\endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// Class header
#import "anotificationsiosnativedelegate.h"

// Global variables
static ANotificationsIOSNativeDelegate* gNotificationsNativeDelegate = nil;

// Global functions
void fNotificationsIOSNativeDelegateInit(void) {
	
	gNotificationsNativeDelegate = [ANotificationsIOSNativeDelegate mInstance];
}

void fNotificationsIOSNativeDelegateDeinit(void) {

	gNotificationsNativeDelegate = nil;
}

void fNotificationsAskPermissions(void) {
	
	if (!gNotificationsNativeDelegate) fNotificationsIOSNativeDelegateInit();
	[gNotificationsNativeDelegate mAskPermissions];
}


// -----------
// Qt part
// -----------


// Class header
#include "anotificationsiosdelegate.h"

QT_BEGIN_NAMESPACE


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsIOSDelegate::ANotificationsIOSDelegate(QObject *parent) : QObject(parent) {

	fNotificationsAskPermissions();

	_A_DEBUG << "ANotificationsIOSDelegate created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANotificationsIOSDelegate::~ANotificationsIOSDelegate(void) {

	fNotificationsIOSNativeDelegateDeinit();

	_A_DEBUG << "ANotificationsIOSDelegate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANotificationsIOSDelegate::mAdd(ANotificationModel inModel) {

	UNMutableNotificationContent* oContent = [[UNMutableNotificationContent alloc] init];
	[oContent setTitle:inModel.Title.toNSString()];
	[oContent setSound:[UNNotificationSound defaultSound]];
	[oContent setSubtitle:inModel.Subtitle.toNSString()];

	UNTimeIntervalNotificationTrigger* oTriger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10.0 repeats:NO];
	UNNotificationRequest* oRequest = [UNNotificationRequest requestWithIdentifier:inModel.ID.toNSString() content:oContent trigger:oTriger];
	[gNotificationsNativeDelegate mAdd:oRequest];
}

QT_END_NAMESPACE
