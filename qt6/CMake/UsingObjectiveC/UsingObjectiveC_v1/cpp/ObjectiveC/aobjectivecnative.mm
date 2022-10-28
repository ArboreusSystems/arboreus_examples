// ----------------------------------------------------------
/*!
    \class AObjectiveCNative
    \title
    \brief Template file classes/cpp/file.cpp

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 28/10/2022 at 17:23:42
    \endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// iOS Class header
#include "aobjectivecnative.h"

// Global variables
static AObjectiveCNative* gObjectiveCNative = nil;


// iOS Class
@implementation AObjectiveCNative


// ---------------------------------------
#pragma mark Init

+(AObjectiveCNative*) mInstance {

	static dispatch_once_t oPredicate;
	static AObjectiveCNative* oSharedInstance = nil;
	dispatch_once(&oPredicate, ^{
		oSharedInstance = [[super alloc] init];
		_A_DEBUG << "AObjectiveCNative instance created";
	});

	_A_DEBUG << "AObjectiveCNative instance shared";
	return oSharedInstance;
}

-(void) mInit {

	[self setPString:@"String from Objective-C Class"];
}


// ---------------------------------------
#pragma mark Test

-(NSString*) mGetString {

	return _pString;
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

void fObjectiveCNative_Init(void) {
	
	if (!gObjectiveCNative) {
		gObjectiveCNative = [AObjectiveCNative mInstance];
		[gObjectiveCNative mInit];
	}
}

void fObjectiveCNative_Delete(void) {

	gObjectiveCNative = nil;
}

QString fObjectiveCNative_TestString(void) {

	QString oOutput;
	oOutput = QString::fromNSString([gObjectiveCNative mGetString]);

	return oOutput;
}

QT_END_NAMESPACE
