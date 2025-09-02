// ----------------------------------------------------------
/*!
	\headerfile AObjectiveCNative
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2022 at 17:23:42
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTIVECNATIVE_H
#define AOBJECTIVECNATIVE_H

// Precompiled includes
#include <aobjcswiftlibrary_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>


// -----------
// IOS part
// -----------

// iOS includes

// iOS imports
#import <Foundation/Foundation.h>
#import <ObjCSwiftLibrary-Swift.h>

// Constants and definitions

// Namespace

// Class definitions
@interface AObjectiveCNative: NSObject

@property (strong,atomic) NSString* pText;
@property (strong,atomic) ASwiftClass* pSwiftClass;

+(AObjectiveCNative*) mInstance;
-(void) mInit;
-(NSString*) mGetText;
-(NSString*) mGetSwiftText;

@end

#endif // AOBJECTIVECNATIVE_H
