// ----------------------------------------------------------
/*!
	\headerfile AWindowPanHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/07/2026 at 13:17:38
	\endlist
*/
// ----------------------------------------------------------
#ifndef AWINDOWPANHANDLER_H
#define AWINDOWPANHANDLER_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class AWindowPanHandler : public QQuickItem {

	Q_OBJECT
	Q_PROPERTY(QQuickItem* mItem READ mItem WRITE mSetItem NOTIFY sgItemChanged FINAL)

	public:

		explicit AWindowPanHandler(QQuickItem* parent = nullptr);
		virtual ~AWindowPanHandler(void) override;

		QQuickItem* mItem(void) const;
		void mSetItem(QQuickItem* inItem);

	protected:

		bool eventFilter(QObject* watched,QEvent* event) override;

	signals:

		void sgItemChanged(void);

	private:

		QQuickItem* pItem = nullptr;
};

#endif // AWINDOWPANHANDLER_H
