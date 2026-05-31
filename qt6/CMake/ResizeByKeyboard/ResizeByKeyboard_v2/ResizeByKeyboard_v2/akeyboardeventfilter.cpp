// ----------------------------------------------------------
/*!
	\class AKeyboardEventFilter
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/05/2026 at 15:02:12
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "akeyboardeventfilter.h"


// -----------
/*!
	\fn

	Doc.
*/

AKeyboardEventFilter::AKeyboardEventFilter(QObject* parent) : QObject{parent} {

}


// -----------
/*!
	\fn

	Doc.
*/

AKeyboardEventFilter::~AKeyboardEventFilter(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

bool AKeyboardEventFilter::eventFilter(QObject* inObject,QEvent* inEvent) {

	if (inEvent->type() == QEvent::InputMethodQuery) {
		auto *imEvent = static_cast<QInputMethodQueryEvent*>(inEvent);
		if (imEvent->queries().testFlag(Qt::ImCursorRectangle)) {
			imEvent->setValue(Qt::ImCursorRectangle,QRectF());
			inEvent->accept();
			return true;
		}
	}

	return QObject::eventFilter(inObject,inEvent);
}

