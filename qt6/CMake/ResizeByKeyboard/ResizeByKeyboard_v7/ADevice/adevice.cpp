/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 17/06/2026 at 08:35:46
 * */// --------------------------------------------------------------

// Class header
#include "adevice.h"


// -----------
/*!
	\fn

	Doc.
*/

ADevice::ADevice(QObject* parent) {

	QObject::connect(
		QGuiApplication::inputMethod(),&QInputMethod::visibleChanged,
		this,&ADevice::slInputMethodVisibleChanged
	);
	QObject::connect(
		QGuiApplication::inputMethod(),&QInputMethod::keyboardRectangleChanged,
		this,&ADevice::slInputMethodKeyboardRectangleChanged
	);

	_A_DEBUG << "ADevice created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADevice::~ADevice(void) {

	_A_DEBUG << "ADevice deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::slInputMethodVisibleChanged(void) {

	QInputMethod* oInputMethod = QGuiApplication::inputMethod();
	emit sgKeyboardVisibleChanged(oInputMethod->isVisible());
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::slInputMethodKeyboardRectangleChanged(void) {

	_A_DEBUG << "ADevice::slInputMethodKeyboardRectangleChanged";
	emit sgKeyboardRectangleChanged();
}

