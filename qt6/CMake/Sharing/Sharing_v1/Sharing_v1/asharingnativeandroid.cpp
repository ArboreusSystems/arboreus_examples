// ----------------------------------------------------------
/*!
	\class ASharingNativeAndroid
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:38:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asharingnativeandroid.h"


// -----------
/*!
	\fn

	Doc.
*/

ASharingNativeAndroid::ASharingNativeAndroid(QObject* parent) : ASharingNative(parent) {

	_A_DEBUG << "ASharingNativeAndroid created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASharingNativeAndroid::~ASharingNativeAndroid(void) {

	_A_DEBUG << "ASharingNativeAndroid deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASharingNativeAndroid::mShareText(const QString& inText) {

	_A_DEBUG << "ASharingNativeAndroid::mShare start";

	QJniObject oIntent("android/content/Intent");
	oIntent.callObjectMethod(
		"setAction",
		"(Ljava/lang/String;)Landroid/content/Intent;",
		QJniObject::fromString("android.intent.action.SEND").object()
	);
	oIntent.callObjectMethod(
		"setType",
		"(Ljava/lang/String;)Landroid/content/Intent;",
		QJniObject::fromString("text/plain").object()
	);
	oIntent.callObjectMethod(
		"putExtra",
		"(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
		QJniObject::fromString("android.intent.extra.TEXT").object(),
		QJniObject::fromString(inText).object()
	);

	QJniObject oChooser = QJniObject::callStaticObjectMethod(
		"android/content/Intent","createChooser",
		"(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;",
		oIntent.object(),
		QJniObject::fromString("Share via").object()
	);

	QNativeInterface::QAndroidApplication::runOnAndroidMainThread([oChooser]() {
		QJniObject oContext = QNativeInterface::QAndroidApplication::context();
		if (oContext.isValid()) {
			oContext.callMethod<void>(
				"startActivity",
				"(Landroid/content/Intent;)V",
				oChooser.object()
			);
		}
	});

	_A_DEBUG << "ASharingNativeAndroid::mShare end";
}

