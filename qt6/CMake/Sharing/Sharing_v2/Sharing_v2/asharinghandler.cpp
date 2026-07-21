// ----------------------------------------------------------
/*!
	\class ASharingHandler
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/07/2026 at 22:09:41
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asharinghandler.h"

// Global variables
ASharingHandler* ASharingHandler::pInstance = nullptr;

// Global functions
#ifdef Q_OS_ANDROID

extern "C" JNIEXPORT void JNICALL
Java_systems_arboreus_AActivity_AActivity_mOnSharedText(JNIEnv*,jclass) {

	ASharingHandler::mReceivePendingText();
}

#endif


// -----------
/*!
	\fn

	Doc.
*/

ASharingHandler::ASharingHandler(QObject* parent) : QObject(parent) {

	pInstance = this;

#ifdef Q_OS_ANDROID

	QTimer::singleShot(0,this,[] {
		ASharingHandler::mReceivePendingText();
	});

#endif

	_A_DEBUG << "ASharingHandler created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASharingHandler::~ASharingHandler(void) {

	if (pInstance == this) pInstance = nullptr;

	_A_DEBUG << "ASharingHandler deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASharingHandler::mReceivePendingText(void) {

#ifdef Q_OS_ANDROID

	_A_DEBUG << "mReceivePendingText start";

	ASharingHandler* oHandler = pInstance;
	if (!oHandler) {
		_A_DEBUG << "No handler";
		return;
	}

	const QString oText = mTakeSharedText();
	if (oText.isEmpty()) {
		_A_DEBUG << "Empty text";
	} else {
		_A_DEBUG << "Received text:" << oText;
	}

	QMetaObject::invokeMethod(
		oHandler,[oHandler,oText] {
			_A_DEBUG << "Signalling text" << oText;
			emit oHandler->sgTextReceived(oText);
		},
		Qt::QueuedConnection
	);

	_A_DEBUG << "mReceivePendingText end";

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

QString ASharingHandler::mTakeSharedText(void) {

	QString oOutput = "NoString";

#ifdef Q_OS_ANDROID

	_A_DEBUG << "mTakeSharedText start";

	const QJniObject oJAVAText = QJniObject::callStaticObjectMethod(
		"systems/arboreus/AActivity/AActivity",
		"mTakeSharedText",
		"()Ljava/lang/String;"
	);

	if (oJAVAText.isValid()) {
		_A_DEBUG << "JAVA text:" << oJAVAText.toString();
	} else {
		_A_DEBUG << "JAVA text not valid";
	}

	oOutput = oJAVAText.toString();

#endif

	_A_DEBUG << "mTakeSharedText end";
	return oOutput;
}

