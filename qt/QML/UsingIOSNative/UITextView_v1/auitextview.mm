// ----------------------------------------------------------
/*!
	\class AUITextView
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/11/2021 at 19:08:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "auitextview.h"

// Apple headers
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>


// -----------
/*!
	\fn

	Doc.
*/

AUITextView::AUITextView(QQuickItem* parent) : QQuickItem(parent) {

	QObject::connect(
		this,&AUITextView::windowChanged,
		this,&AUITextView::slWindowChanged
	);
	QObject::connect(
		this,&AUITextView::visibleChanged,
		this,&AUITextView::slVisibleChanged
	);

	_A_DEBUG << "AUITextView created";
}


// -----------
/*!
	\fn

	Doc.
*/

AUITextView::~AUITextView(void) {
	
	[pTextView release];
	
	_A_DEBUG << "AUITextView deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AUITextView::geometryChanged(const QRectF& inNewGeometry, const QRectF& inOldGeometry) {
	
	QQuickItem::geometryChanged(inNewGeometry, inOldGeometry);
	CGRect oRectangle = this->mToCGRect(mapRectToScene(inNewGeometry).toRect());
	[pTextView setFrame:oRectangle];

	_A_DEBUG << "AUITextView geometryChanged" << inNewGeometry << [pTextView frame].size.width << [pTextView frame].size.height;
}


// -----------
/*!
	\fn

	Doc.
*/

void AUITextView::slWindowChanged(QQuickWindow* inWindow) {

	if (!pTextView) {
		pTextView = [[UITextView alloc] init];
		[pTextView setBackgroundColor:[UIColor yellowColor]];
		[pTextView setClipsToBounds:YES];
		[pTextView.layer setBorderColor:[[[UIColor blueColor] colorWithAlphaComponent:1.0] CGColor]];
		[pTextView.layer setBorderWidth:5.0];
		[pTextView.layer setCornerRadius:20.0];
		[pTextView setFont:[UIFont systemFontOfSize:15]];
	}

	if (inWindow != nullptr) {
		UIView* oParentView = reinterpret_cast<UIView*>(inWindow->winId());
		[oParentView addSubview:pTextView];
	} else {
		[pTextView removeFromSuperview];
	}
	
	_A_DEBUG << "AUITextView slWindowChanged";
}


// -----------
/*!
	\fn

	Doc.
*/

void AUITextView::slVisibleChanged(void) {

	[pTextView setHidden:this->isVisible()];
	
	_A_DEBUG << "AUITextView slVisibleChanged";
}


// -----------
/*!
	\fn

	Doc.
*/

CGRect AUITextView::mToCGRect(const QRectF& inRectangle) {

	return CGRectMake(
		inRectangle.x(), inRectangle.y(),
		inRectangle.width(), inRectangle.height()
	);
}

