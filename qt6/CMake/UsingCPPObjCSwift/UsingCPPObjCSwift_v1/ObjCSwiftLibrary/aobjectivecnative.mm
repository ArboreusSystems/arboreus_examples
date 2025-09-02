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
	
	[self setPSwiftClass:[[ASwiftClass alloc] init]];
	[self setPText:@"Text from Objective-C Class"];
}


// ---------------------------------------
#pragma mark Test

-(NSString*) mGetText {

	return _pText;
}

-(NSString*) mGetSwiftText {
	
	return [_pSwiftClass mTestText];
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

// Qt/C++ class header
#include <aobjectivecwrapper.h>


// -----------
/*!
	\fn

	Doc.
*/

AObjectiveCWrapper::AObjectiveCWrapper(QObject* parent) : QObject(parent) {

	gObjectiveCNative = [AObjectiveCNative mInstance];
	[gObjectiveCNative mInit];

	_A_DEBUG << "AObjectiveCWrapper created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectiveCWrapper::~AObjectiveCWrapper(void) {

	_A_DEBUG << "AObjectiveCWrapper deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjectiveCWrapper::mGetText(void) {

	QString oOutput = QString::fromNSString([gObjectiveCNative mGetText]);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjectiveCWrapper::mGetSwiftText(void) {

	QString oOutput = QString::fromNSString([gObjectiveCNative mGetSwiftText]);
	return oOutput;
}

QT_END_NAMESPACE

