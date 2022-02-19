// ----------------------------------------------------------
/*!
	\class
    \title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 17:18:30
	\endlist
*/
// ----------------------------------------------------------

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Apple includes
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


// -----------
// IOS part
// -----------


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE
#include "asafeareaios.h"


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaIOS::ASafeAreaIOS(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaIOS::~ASafeAreaIOS(void) {}


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaInsets* ASafeAreaIOS::mGetInsets(void) {

	ASafeAreaInsets* oOutput = new ASafeAreaInsets();

	if (@available(iOS 11.0, *)) {
		UIWindow *window = UIApplication.sharedApplication.keyWindow;
		oOutput->pTop = (int)roundf(window.safeAreaInsets.top);
		oOutput->pBottom = (int)roundf(window.safeAreaInsets.bottom);
		oOutput->pLeft = (int)roundf(window.safeAreaInsets.left);
		oOutput->pRight = (int)roundf(window.safeAreaInsets.right);
	}

	return oOutput;
}

QT_END_NAMESPACE
