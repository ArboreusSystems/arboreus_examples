// ----------------------------------------------------------
/*!
	\class AUISkin
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/10/2020 at 23:37:34
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "auiskin.h"


// -----------
/*!
	\fn

	Doc.
*/

AUISkin::AUISkin(QObject *parent) : QObject(parent) {

	pFontDatabase = new QFontDatabase();

	this->mSetFontFamiliesSystem();
	this->mSetFontFamiliesCustom();
	this->mSetFontFamilyCustom("Pangolin");

	ALOG_SYSTEM << "AUISkin created";
}


// -----------
/*!
	\fn

	Doc.
*/

AUISkin::~AUISkin(void) {

	ALOG_SYSTEM << "AUISkin deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AUISkin::mFontFamily(void) {

	return pFontFamily;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList AUISkin::mFontFamiliesSystem(void) {

	return pFontFamiliesSystem;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList AUISkin::mFontFamiliesCustom(void) {

	return pFontFamiliesCustom;
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamilyCaveat(void) {

	QFontDatabase::removeAllApplicationFonts();
	QFontDatabase::addApplicationFont(":/res/fonts/Caveat/Caveat-Bold.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Caveat/Caveat-Regular.ttf");
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamilyOpenSansCondensed(void) {

	QFontDatabase::removeAllApplicationFonts();
	QFontDatabase::addApplicationFont(":/res/fonts/Open_Sans_Condensed/OpenSansCondensed-Bold.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Open_Sans_Condensed/OpenSansCondensed-Light.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Open_Sans_Condensed/OpenSansCondensed-LightItalic.ttf");
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamilyPangolin(void) {

	QFontDatabase::removeAllApplicationFonts();
	QFontDatabase::addApplicationFont(":/res/fonts/Pangolin/Pangolin-Regular.ttf");
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamilyPhilosopher(void) {

	QFontDatabase::removeAllApplicationFonts();
	QFontDatabase::addApplicationFont(":/res/fonts/Philosopher/Philosopher-Bold.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Philosopher/Philosopher-BoldItalic.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Philosopher/Philosopher-Italic.ttf");
	QFontDatabase::addApplicationFont(":/res/fonts/Philosopher/Philosopher-Regular.ttf");
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamilyCustom(QString inFontFamilyID) {

	if (inFontFamilyID == "Caveat") {
		this->mSetFontFamilyCaveat();
	} else if (inFontFamilyID == "Open Sans Condensed") {
		this->mSetFontFamilyOpenSansCondensed();
	} else if (inFontFamilyID == "Pangolin") {
		this->mSetFontFamilyPangolin();
	} else if (inFontFamilyID == "Philosopher") {
		this->mSetFontFamilyPhilosopher();
	}
	pFontFamily = QFontDatabase::applicationFontFamilies(0)[0];
	emit sgSkinChanged();
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamiliesSystem(void) {

	foreach (QString iFamily, pFontDatabase->families(QFontDatabase::Any)) {
		pFontFamiliesSystem << iFamily;
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void AUISkin::mSetFontFamiliesCustom(void) {

	pFontFamiliesCustom << "Caveat";
	pFontFamiliesCustom << "Open Sans Condensed";
	pFontFamiliesCustom << "Pangolin";
	pFontFamiliesCustom << "Philosopher";
}
