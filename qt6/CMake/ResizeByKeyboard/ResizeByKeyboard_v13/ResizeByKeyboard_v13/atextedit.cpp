// ----------------------------------------------------------
/*!
	\class ATextArea
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/07/2026 at 08:54:49
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "atextedit.h"


// -----------
/*!
	\fn

	Doc.
*/

ATextEdit::ATextEdit(QQuickItem* parent) {

	_A_DEBUG << "ATextEdit created";
}


// -----------
/*!
	\fn

	Doc.
*/

ATextEdit::~ATextEdit(void) {

	_A_DEBUG << "ATextEdit deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

bool ATextEdit::eventFilter(QObject* inWatched, QEvent* inEvent) {

#ifdef Q_OS_IOS

	if (inWatched == this && inEvent->type() == QEvent::InputMethodQuery) {

		auto* oInputMethodQueryEvent = static_cast<QInputMethodQueryEvent*>(inEvent);
		if (oInputMethodQueryEvent->queries() & Qt::ImCursorRectangle) {

			QVariant oValueRectangle = oInputMethodQueryEvent->value(Qt::ImCursorRectangle);
			_A_DEBUG << "Value" << oValueRectangle;
			if (oValueRectangle.isValid()) {
				QRectF oRect = oValueRectangle.toRectF();
				_A_DEBUG << "Cursor rect:" << oRect;
			} else {
				_A_DEBUG << "Invalid";
			}

			oInputMethodQueryEvent->setValue(Qt::ImCursorRectangle,QRectF());

			unsigned long oRemainingQueries = oInputMethodQueryEvent->queries() & ~Qt::ImCursorRectangle;
			if (oRemainingQueries == 0) {
				_A_DEBUG << "Remain queries == 0";
				return true;
			} else {
				_A_DEBUG << "Remain queries ==" << oRemainingQueries;
			}
		}
	}

#endif

	return QQuickItem::eventFilter(inWatched,inEvent);
}
