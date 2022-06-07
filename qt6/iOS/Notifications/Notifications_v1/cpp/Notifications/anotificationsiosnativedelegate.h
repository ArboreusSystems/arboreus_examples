// ----------------------------------------------------------
/*!
	\headerfile ANotificationsIOSNativeDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 10:39:19
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFICATIONSIOSNATIVEDELEGATE_H
#define ANOTIFICATIONSIOSNATIVEDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>
#include <anotificationsglobal.h>

// iOS includes
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

// Class definitions
@interface ANotificationsIOSNativeDelegate: NSObject

@property (strong,atomic) UNUserNotificationCenter* pNotificationCenter;

+(ANotificationsIOSNativeDelegate*) mInstance;
-(void) mAskPermissions;
-(void) mAdd:(UNNotificationRequest*)inRequest;

@end

#endif // ANOTIFICATIONSIOSNATIVEDELEGATE_H
