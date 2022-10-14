// ----------------------------------------------------------
/*!
	\headerfile AppDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/04/2022 at 08:53:45
	\endlist
*/
// ----------------------------------------------------------

#ifndef AIOSAPPDELEGATE_H
#define AIOSAPPDELEGATE_H

#import <UIKit/UIKit.h>
#import <aiosappstate.h>

@interface AIOSAppDelegate: UIResponder <UIApplicationDelegate>

+(AIOSAppDelegate*) mSharedAppDelegate;

@end

#endif // AIOSAPPDELEGATE_H
