// ----------------------------------------------------------
/*!
	\headerfile AApplicationDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 17:41:09
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONDELEGATE_H
#define AAPPLICATIONDELEGATE_H

// System includes
#include <aloggerglobal.h>

// iOS includes
#import <UIKit/UIKit.h>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
@interface AApplicationDelegate : UIResponder <UIApplicationDelegate>

@property (strong,nonatomic) UIWindow* window;

@end

#endif // AAPPLICATIONDELEGATE_H
