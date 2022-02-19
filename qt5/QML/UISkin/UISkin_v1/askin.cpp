// ----------------------------------------------------------
/*!
	\class ASking
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2020 at 20:14:29
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "askin.h"


// -----------
/*!
	\fn

	Doc.
*/

ASkin::ASkin(AColors *inColors, QObject *parent) : QObject(parent) {

	pColors = inColors;
	mSetDefaultSkin1();
	ALOG_SYSTEM << "ASkin created with colors";
}


// -----------
/*!
	\fn

	Doc.
*/

ASkin::ASkin(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ASkin created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASkin::~ASkin(void) {

	ALOG_SYSTEM << "ASkin deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASkin::mSetSkin(QString inSkinID) {

	if (inSkinID == "Skin1") {
		mSetDefaultSkin1();
	} else if (inSkinID == "Skin2") {
		mSetDefaultSkin2();
	} else {
		mSetDefaultSkin3();
	}

	emit sgSkinChanged();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASkin::mSetDefaultSkin1(void) {

	pCurrentSkin = {};
	pCurrentSkin.insert(SKIN_DEFAULT_COLOR_ID,pColors->mWhite());
	pCurrentSkin.insert("background",pColors->mPurple());
	pCurrentSkin.insert("button_background",pColors->mBlueDark());
	pCurrentSkin.insert("button_text",pColors->mWhiteLight());
	pCurrentSkin.insert("text_background",pColors->mSaladDark());
	pCurrentSkin.insert("text",pColors->mWhiteLight());

	ALOG_SYSTEM << "Skin changed onto Skin1";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASkin::mSetDefaultSkin2(void) {

	pCurrentSkin = {};
	pCurrentSkin.insert(SKIN_DEFAULT_COLOR_ID,pColors->mWhite());
	pCurrentSkin.insert("background",pColors->mSaladLight());
	pCurrentSkin.insert("button_background",pColors->mOrangeDark());
	pCurrentSkin.insert("button_text",pColors->mWhiteLight());
	pCurrentSkin.insert("text_background",pColors->mBlueDark());
	pCurrentSkin.insert("text",pColors->mWhiteLight());

	ALOG_SYSTEM << "Skin changed onto Skin2";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASkin::mSetDefaultSkin3(void) {

	pCurrentSkin = {};
	pCurrentSkin.insert(SKIN_DEFAULT_COLOR_ID,pColors->mWhite());
	pCurrentSkin.insert("background",pColors->mOrangeLight());
	pCurrentSkin.insert("button_background",pColors->mPurpleDark());
	pCurrentSkin.insert("button_text",pColors->mWhiteLight());
	pCurrentSkin.insert("text_background",pColors->mWhite());
	pCurrentSkin.insert("text",pColors->mBlueDark());

	ALOG_SYSTEM << "Skin changed onto Skin3";
}


// -----------
/*!
	\fn

	Doc.
*/

QString ASkin::mGetColorFor(QString inUIObjectID) {

	QString oColor = pCurrentSkin.value(inUIObjectID,SKIN_NO_COLOR);

	if (oColor == SKIN_NO_COLOR) {
		oColor = pCurrentSkin.value(SKIN_DEFAULT_COLOR_ID);
	}

	return oColor;
}
