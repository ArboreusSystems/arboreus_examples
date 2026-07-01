// ----------------------------------------------------------
/*!
	\class AWindowPanHandler
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/07/2026 at 13:17:38
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "awindowpanhandler.h"


// -----------
/*!
	\fn

	Doc.
*/

AWindowPanHandler::AWindowPanHandler(QQuickItem* parent) : QQuickItem(parent) {

	_A_DEBUG << "AWindowPanHandler created";
}


// -----------
/*!
	\fn

	Doc.
*/

AWindowPanHandler::~AWindowPanHandler(void) {

	if (pItem) pItem->removeEventFilter(this);

	_A_DEBUG << "AWindowPanHandler deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QQuickItem* AWindowPanHandler::mItem() const {

	return pItem;
}


// -----------
/*!
	\fn

	Doc.
*/

void AWindowPanHandler::mSetItem(QQuickItem* inItem) {

	if (pItem == inItem) return;

	if (pItem) pItem->removeEventFilter(this);
	pItem = inItem;
	if (pItem) pItem->installEventFilter(this);

	emit sgItemChanged();
}


// -----------
/*!
	\fn

	Doc.
*/

bool AWindowPanHandler::eventFilter(QObject* inWatchedItem, QEvent* inEvent) {

#ifdef Q_OS_IOS

	if (inWatchedItem == pItem && inEvent->type() == QEvent::InputMethodQuery) {

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

	return QQuickItem::eventFilter(inWatchedItem,inEvent);
}
