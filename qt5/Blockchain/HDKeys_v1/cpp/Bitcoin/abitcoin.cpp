// ----------------------------------------------------------
/*!
	\class ABitcoin
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/12/2020 at 23:29:51
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abitcoin.h"


// -----------
/*!
	\fn

	Doc.
*/

ABitcoin::ABitcoin(QObject *parent) : QObject(parent) {

	pSettings = new settings(config::settings::mainnet);
	pKeys = new ABitcoinKeys(this);

	ALOG_SYSTEM << "ABitcoin created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABitcoin::~ABitcoin(void) {

	ALOG_SYSTEM << "ABitcoin deleted";
}
