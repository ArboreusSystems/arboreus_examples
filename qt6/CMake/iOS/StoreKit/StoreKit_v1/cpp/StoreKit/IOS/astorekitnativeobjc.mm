// ----------------------------------------------------------
/*!
    \class AStoreKitNativeOBJC
    \title
    \brief Template file classes/cpp/file.cpp

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 03/02/2023 at 15:30:28
    \endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// Class header
#include "astorekitnativeobjc.h"

// Global variables
static AStoreKitNativeOBJC* gAStoreKitNativeOBJC = nil;


// iOS Class
@implementation AStoreKitNativeOBJC


// ---------------------------------------
#pragma mark Init

+(AStoreKitNativeOBJC*) mInstance {

	static dispatch_once_t oPredicate;
	static AStoreKitNativeOBJC* oSharedInstance = nil;
	dispatch_once(&oPredicate, ^{
		oSharedInstance = [[super alloc] init];
		_A_DEBUG << "AStoreKitNativeOBJC instance created";
	});

	_A_DEBUG << "AStoreKitNativeOBJC instance shared";
	return oSharedInstance;
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

void fStoreKitNativeOBJC_Init(void) {

	if (!gAStoreKitNativeOBJC) {
		gAStoreKitNativeOBJC = [AStoreKitNativeOBJC mInstance];
	}
}

QT_END_NAMESPACE
