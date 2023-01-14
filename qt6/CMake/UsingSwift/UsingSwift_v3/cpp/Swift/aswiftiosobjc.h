// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/12/2022 at 23:27:51
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASWIFTIOSOBJC_H
#define ASWIFTIOSOBJC_H

// System includes

// Application includes
#include <aloggerglobal.h>

// iOS includes

// iOS imports
#import <Foundation/Foundation.h>

// iOS Swift interface
#import <aswiftobjcinterface.h>

// Constants and defintions

// Namespace

// Class definitions
@interface ASwiftIOSObjC: NSObject

@property (strong,atomic) ASwiftIOSSwift* pSwift;

+(ASwiftIOSObjC*) mInstance;

@end

#endif // ASWIFTIOSOBJC_H
