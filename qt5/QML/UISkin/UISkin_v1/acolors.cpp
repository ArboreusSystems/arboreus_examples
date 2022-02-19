// ----------------------------------------------------------
/*!
	\class AColors
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2020 at 19:55:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acolors.h"


// -----------
/*!
	\fn

	Doc.
*/

AColors::AColors(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "AColors created";
}


// -----------
/*!
	\fn

	Doc.
*/

AColors::~AColors(void) {

	ALOG_SYSTEM << "AColors deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mTransparent(void) {

	return QString("transparent");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mWhiteLight(void) {

	return QString("#FFFFFF");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mWhite(void) {

	return QString("#F0F0F0");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreyLight(void) {

	return QString("#E6E7E8");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGrey(void) {

	return QString("#D2D3D4");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreyDark(void) {

	return QString("#BCBEC0");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreyDarkest(void) {

	return QString("#666666");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlackLight(void) {

	return QString("#080707");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlack(void) {

	return QString("#050404");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlackDark(void) {

	return QString("#000000");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mPurpleLight(void) {

	return QString("#b21875");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mPurple(void) {

	return QString("#900a5b");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mPurpleDark(void) {

	return QString("#5e083c");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mRedLight(void) {

	return QString("#E42931");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mRed(void) {

	return QString("#B71F31");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mRedDark(void) {

	return QString("#771021");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreenLight(void) {

	return QString("#3F7F2F");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreen(void) {

	return QString("#3E6C34");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mGreenDark(void) {

	return QString("#245618");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlueLight(void) {

	return QString("#5cbbfb");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlue(void) {

	return QString("#50a2d9");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mBlueDark(void) {

	return QString("#186497");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mSaladLight(void) {

	return QString("#92da2f");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mSalad(void) {

	return QString("#66a511");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mSaladDark(void) {

	return QString("#539000");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mFiolentLight(void) {

	return QString("#8053f3");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mFiolent(void) {

	return QString("#5626d2");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mFiolentDark(void) {

	return QString("#402190");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mOrangeLight(void) {

	return QString("#fcaa4a");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mOrange(void) {

	return QString("#f68c0f");
}


// -----------
/*!
	\fn

	Doc.
*/

QString AColors::mOrangeDark(void) {

	return QString("#d67400");
}
