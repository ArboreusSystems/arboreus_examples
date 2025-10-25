// ----------------------------------------------------------
/*!
	\class AApplicationDelegate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 17:41:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplicationdelegate.h"


@implementation AApplicationDelegate

- (instancetype)init {
	
	self = [super init];
	if (self) {
		_A_DEBUG << "MacOS native delegate ->" << "init";
	}
	return self;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationWillFinishLaunching";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationWillFinishLaunching:)]) {
		[_QtDelegate applicationWillFinishLaunching:notification];
	}
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationDidFinishLaunching";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationDidFinishLaunching:)]) {
		[_QtDelegate applicationDidFinishLaunching:notification];
	}
}

- (void)applicationWillHide:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationWillHide";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationWillHide:)]) {
		[_QtDelegate applicationWillHide:notification];
	}
}

- (void)applicationDidHide:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationDidHide";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationDidHide:)]) {
		[_QtDelegate applicationDidHide:notification];
	}
}

- (void)applicationWillBecomeActive:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationWillBecomeActive";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationWillBecomeActive:)]) {
		[_QtDelegate applicationWillBecomeActive:notification];
	}
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationDidBecomeActive";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationDidBecomeActive:)]) {
		[_QtDelegate applicationDidBecomeActive:notification];
	}
}

- (void)applicationWillResignActive:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationWillResignActive";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationWillResignActive:)]) {
		[_QtDelegate applicationWillResignActive:notification];
	}
}

- (void)applicationDidResignActive:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationDidResignActive";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationDidResignActive:)]) {
		[_QtDelegate applicationDidResignActive:notification];
	}
}

- (void)applicationWillTerminate:(NSNotification *)notification {

	_A_DEBUG << "MacOS native delegate ->" << "applicationWillTerminate";
	
	if ([_QtDelegate respondsToSelector:@selector(applicationWillTerminate:)]) {
		[_QtDelegate applicationWillTerminate:notification];
	}
}

- (id)forwardingTargetForSelector:(SEL)selector {
	
	if ([_QtDelegate respondsToSelector:selector]) {
		return _QtDelegate;
	}
	return [super forwardingTargetForSelector:selector];
}

- (BOOL)respondsToSelector:(SEL)selector {
	
	if ([super respondsToSelector:selector]) {
		return YES;
	}
	return [_QtDelegate respondsToSelector:selector];
}

@end
