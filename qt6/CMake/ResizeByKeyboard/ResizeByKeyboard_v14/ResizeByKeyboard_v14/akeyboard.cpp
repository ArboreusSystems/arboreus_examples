// ----------------------------------------------------------
/*!
	\class AKeyboard
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/07/2026 at 18:51:15
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

AKeyboard::AKeyboard(QObject* parent) : QObject{parent} {

	_A_DEBUG << "AKeyboard created";
}


// -----------
/*!
	\fn

	Doc.
*/

AKeyboard::~AKeyboard(void) {

	_A_DEBUG << "AKeyboard deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

double AKeyboard::mHeight(void) {

	double oOutput = 0.0;

#ifdef Q_OS_ANDROID

	QJniObject oActivity = QNativeInterface::QAndroidApplication::context();
	QJniObject oWindow = oActivity.callObjectMethod("getWindow","()Landroid/view/Window;");
	QJniObject oDecorView = oWindow.callObjectMethod("getDecorView","()Landroid/view/View;");
	QJniObject oRootInsets = oDecorView.callObjectMethod("getRootWindowInsets","()Landroid/view/WindowInsets;");

	if (oRootInsets.isValid()) {

		QJniObject oImeInsets = oRootInsets.callObjectMethod("getInsets","(I)Landroid/graphics/Insets;",8);

		if (oImeInsets.isValid()) {

			int oBottomPixelHeight = oImeInsets.getField<int>("bottom");
			double oDevicePixelRatio = QGuiApplication::primaryScreen()->devicePixelRatio();
			double oHeightInQml = oBottomPixelHeight / oDevicePixelRatio;
			if (oOutput != oHeightInQml) oOutput = oHeightInQml;
		}
	}

#elifdef Q_OS_IOS

	QInputMethod* oInputMethod = QGuiApplication::inputMethod();
	QRectF oRectangle = oInputMethod->keyboardRectangle();
	oOutput = oRectangle.height();

#endif

	return oOutput;
}

