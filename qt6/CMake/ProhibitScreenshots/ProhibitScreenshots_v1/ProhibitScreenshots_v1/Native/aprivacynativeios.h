// ----------------------------------------------------------
/*!
	\headerfile APrivacyNativeIOS
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2026 at 15:18:42
	\endlist
*/
// ----------------------------------------------------------
#ifndef APRIVACYNATIVEIOS_H
#define APRIVACYNATIVEIOS_H

// Precompiled includes
#include <main_pch.h>

// System includes

// iOS includes
#import <UIKit/UIKit.h>

// Application includes
#include <alogger.h>
#include <aprivacy.h>

// Namesapces

// Constants and definitions

// Class definitions
@interface APrivacyNativeIOSHandler : NSObject

	@property (nonatomic,strong) UIView* pPrivacyScreen;
    @property (nonatomic,assign) BOOL pAction;

@end

#endif // APRIVACYNATIVEIOS_H
