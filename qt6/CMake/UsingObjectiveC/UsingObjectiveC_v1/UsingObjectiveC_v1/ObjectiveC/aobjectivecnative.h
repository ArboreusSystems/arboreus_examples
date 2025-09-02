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

// System includes

// Precompiled includes
#include <ObjectiveC/aobjectivecpch.h>

// Application includes
#include <aloggerglobal.h>

// iOS includes

// iOS imports
#import <Foundation/Foundation.h>

// Constants and definitions

// Namespace

// Class definitions
@interface AObjectiveCNative: NSObject

@property (strong,atomic) NSString* pString;

+(AObjectiveCNative*) mInstance;
-(void) mInit;
-(NSString*) mGetString;

@end

#endif // AOBJECTIVECNATIVE_H
