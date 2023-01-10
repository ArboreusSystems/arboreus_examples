// ----------------------------------------------------------
/*!
	\class ASwiftIOSNative
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/12/2022 at 23:25:31
	\endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// iOS Class header
#import "aswiftiosobjc.h"

// Global variables
static ASwiftIOSObjC* gSwiftIOSObjC __unused = nil;

// iOS Class
@implementation ASwiftIOSObjC


// ---------------------------------------
#pragma mark Init

+(ASwiftIOSObjC*) mInstance {

	static dispatch_once_t oPredicate;
	static ASwiftIOSObjC* oSharedDelegate = nil;
	dispatch_once(&oPredicate, ^{
		oSharedDelegate = [[super alloc] init];
		_A_DEBUG << "ASwiftIOSObjC instance created";
	});

	_A_DEBUG << "ASwiftIOSObjC instance shared";
	return oSharedDelegate;
}

-(instancetype) init {

	self = [super init];
	if (self) {
		
		[self setPSwift:[[ASwiftIOSSwift alloc] init]];
		_A_DEBUG << "ASwiftIOSObjC init";
		
	}
	return self;
}


@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE

// Class header
#include "aswiftiosnative.h"


// -----------
/*!
	\fn

	Doc.
*/

ASwiftIOSNative::ASwiftIOSNative(QObject* parent) : QObject(parent) {

	gSwiftIOSObjC = [ASwiftIOSObjC mInstance];

	_A_DEBUG << "ASwiftIOSNative created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASwiftIOSNative::~ASwiftIOSNative(void) {

	_A_DEBUG << "ASwiftIOSNative deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString ASwiftIOSNative::mString(void) {

	QString oString = QString::fromNSString([gSwiftIOSObjC.pSwift mString]);
	return oString;
}

QT_END_NAMESPACE
