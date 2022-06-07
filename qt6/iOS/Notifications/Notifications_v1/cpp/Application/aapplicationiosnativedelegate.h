// ----------------------------------------------------------
/*!
	\headerfile AApplicationIOSNativeDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 14:10:22
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONIOSNATIVEDELEGATE_H
#define AAPPLICATIONIOSNATIVEDELEGATE_H

// System includes

// Application includes
#include <abackend.h>
#include <anotificationsglobal.h>

// iOS includes
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Constants and definitions

// Namespace

// Class definitions
@interface AApplicationIOSNativeDelegate: UIResponder <UIApplicationDelegate>

+(AApplicationIOSNativeDelegate*) mInstance;

@end

#endif // AAPPLICATIONIOSNATIVEDELEGATE_H
