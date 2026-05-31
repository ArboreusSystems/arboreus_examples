// ----------------------------------------------------------
/*!
	\class AKeyboard
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/05/2026 at 16:52:14
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "akeyboard.h"


// -----------
/*!
	\fn

	Doc.
*/

AKeyboard::AKeyboard(QObject* parent) : QObject{parent} {}


// -----------
/*!
	\fn

	Doc.
*/

AKeyboard::~AKeyboard(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void AKeyboard::disableKeyboardScroll(QQuickItem* item) {

	if (item) {
		item->installEventFilter(new AKeyboardEventFilter(item));
	}
}

