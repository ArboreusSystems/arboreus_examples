// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/10/2025 at 21:31:48
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONDELEGATE_H
#define AAPPLICATIONDELEGATE_H

// Precompiled includes

// System includes

// Application includes
#include <aloggerglobal.h>
#include <aapplicationdelegateglobal.h>

// iOS includes
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

// Interface
@interface AApplicationDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic,retain) id QtDelegate;

- (void)applicationWillFinishLaunching:(NSNotification *)notification;
- (void)applicationDidFinishLaunching:(NSNotification *)notification;
- (void)applicationWillHide:(NSNotification *)notification;
- (void)applicationDidHide:(NSNotification *)notification;
- (void)applicationWillBecomeActive:(NSNotification *)notification;
- (void)applicationDidBecomeActive:(NSNotification *)notification;
- (void)applicationWillResignActive:(NSNotification *)notification;
- (void)applicationDidResignActive:(NSNotification *)notification;
- (void)applicationWillTerminate:(NSNotification *)notification;

@end

// Global functions
extern "C" {

void fNativeMacOSDelegateInit() {
	
	NSApplication* oSharedApplication = [NSApplication sharedApplication];
	AApplicationDelegate* oApplicationDelegate = [[AApplicationDelegate alloc] init];
	oApplicationDelegate.QtDelegate = [oSharedApplication delegate];
	[oSharedApplication setDelegate:oApplicationDelegate];

	_A_DEBUG << "Application delegate initiated";
}

}

#endif // AAPPLICATIONDELEGATE_H
