// ----------------------------------------------------------
/*!
	\headerfile AStoreKitNativeOBJC
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 15:30:28
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKITNATIVEOBJC_H
#define ASTOREKITNATIVEOBJC_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// iOS includes

// iOS imports
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

// Application includes
#include <aloggerglobal.h>
#include <astorekitnativeobjcglobal.h>

// Constants and definitions

// Namespace

// Class definitions
@interface AStoreKitNativeOBJC: NSObject

+(AStoreKitNativeOBJC*) mInstance;

@end

#endif // ASTOREKITNATIVEOBJC_H
