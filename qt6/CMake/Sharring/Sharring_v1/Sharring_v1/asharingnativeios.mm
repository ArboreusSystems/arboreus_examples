// ----------------------------------------------------------
/*!
	\class ASharingNativeIOS
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:38:31
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asharingnativeios.h"

// iOS includes
#import <UIKit/UIKit.h>


// -----------
/*!
	\fn

	Doc.
*/

ASharingNativeIOS::ASharingNativeIOS(QObject* parent) : ASharingNative(parent) {

    _A_DEBUG << "ASharingNativeIOS created";
}


// -----------
/*!
    \fn

    Doc.
*/

ASharingNativeIOS::~ASharingNativeIOS(void) {

    _A_DEBUG << "ASharingNativeIOS deleted";
}


// -----------
/*!
    \fn

    Doc.
*/

void ASharingNativeIOS::mShareText(const QString& inText) {

    _A_DEBUG << "ASharingNativeIOS::mShare begin";

    NSString* oString = inText.toNSString();
    NSArray* oItems = @[oString];

    UIActivityViewController* oActivityController = [[UIActivityViewController alloc] initWithActivityItems:oItems applicationActivities:nil];
    UIViewController* oRootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;

    [oRootViewController presentViewController:oActivityController animated:YES completion:nil];

    _A_DEBUG << "ASharingNativeIOS::mShare end";
}


