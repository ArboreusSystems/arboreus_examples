// ----------------------------------------------------------
/*!
	\class ATranslator
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/05/2020 at 18:11:15
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "atranslator.h"


// -----------
/*!
	\fn

	Doc.
*/

ATranslator::ATranslator(QObject *parent) : QObject(parent) {

	pTranslator = new QTranslator();

	aLOG << "ATranslator created";
}


// -----------
/*!
	\fn

	Doc.
*/

ATranslator::~ATranslator(void) {

	aLOG << "ATranslator deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ATranslator::mSetLanguage(QString inLanguageCode) {

	aLOG << "ATranslator::mSetLanguage ->" << inLanguageCode;
	pTranslator->load(":/QtLanguage_" + inLanguageCode);
	qApp->installTranslator(pTranslator);
	emit sgLanguageChanged();
}

