// ----------------------------------------------------------
/*!
	\headerfile AApplicationIOSDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 16:43:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONIOSDELEGATE_H
#define AAPPLICATIONIOSDELEGATE_H

// System includes

// Application includes
#include <abackend.h>

// iOS includes
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Constants and definitions

// Namespace

// Class definitions
@interface AApplicationIOSDelegate: UIResponder <UIApplicationDelegate>

+(AApplicationIOSDelegate*) mInstance;

@end

#endif // AAPPLICATIONIOSDELEGATE_H
