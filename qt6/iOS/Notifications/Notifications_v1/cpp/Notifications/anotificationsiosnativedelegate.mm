// ----------------------------------------------------------
/*!
	\class ANotificationsIOSNativeDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 10:39:19
	\endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// Class header
#include "anotificationsiosnativedelegate.h"


// iOS Class
@implementation ANotificationsIOSNativeDelegate

+(ANotificationsIOSNativeDelegate*) mInstance {

	static dispatch_once_t oPredicate;
	static ANotificationsIOSNativeDelegate* oSharedDelegate = nil;
	dispatch_once(&oPredicate, ^{
		oSharedDelegate = [[super alloc] init];
		_A_DEBUG << "ANotificationsIOSNativeDelegate created";
	});

	_A_DEBUG << "ANotificationsIOSNativeDelegate instance shared";
	return oSharedDelegate;
}

-(void) mAskPermissions {
	
	_A_DEBUG << "3;";
	
	[self setPNotificationCenter:[UNUserNotificationCenter currentNotificationCenter]];
	
	UNAuthorizationOptions oOptions = (UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound);
	[_pNotificationCenter requestAuthorizationWithOptions:oOptions completionHandler:^(BOOL inGranted, NSError* _Nullable inError) {
			
		if (inError) _A_DEBUG << "Requesting permissions failed";
		if (inGranted) _A_DEBUG << "Permissions granted";
	}];
}

-(void) mAdd:(UNNotificationRequest *)inRequest {
	
	[_pNotificationCenter addNotificationRequest:inRequest withCompletionHandler:^(NSError* _Nullable inError) {
		
		if (inError) {
			_A_DEBUG << "Adding notification failed";
		} else {
			_A_DEBUG << "Added notification";
		}
	}];
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

QT_END_NAMESPACE
