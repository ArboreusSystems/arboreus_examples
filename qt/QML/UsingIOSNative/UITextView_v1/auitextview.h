// ----------------------------------------------------------
/*!
	\headerfile AUITextView
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/11/2021 at 19:08:09
	\endlist
*/
// ----------------------------------------------------------

#ifndef AUITEXTVIEW_H
#define AUITEXTVIEW_H

// System includes
#include <QQuickItem>
#include <QQuickWindow>
#include <QDebug>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Forwarded classes
Q_FORWARD_DECLARE_OBJC_CLASS(UITextView);


// Class definitions
class AUITextView : public QQuickItem {

	Q_OBJECT

	public:

		AUITextView(QQuickItem* parent = nullptr);
		virtual ~AUITextView(void);

		void geometryChanged(const QRectF& inNewGeometry, const QRectF& inOldGeometry) override;

	private slots:

		void slWindowChanged(QQuickWindow* window);
		void slVisibleChanged(void);

	private:

		UITextView* pTextView = nullptr;

		CGRect mToCGRect(const QRectF& inRectangle);
};

#endif // AUITEXTVIEW_H
