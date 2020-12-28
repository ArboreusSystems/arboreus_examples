// ----------------------------------------------------------
/*!
	\class ABitcoinKeys
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2020 at 14:37:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abitcoinkeys.h"


// -----------
/*!
	\fn

	Doc.
*/

ABitcoinKeys::ABitcoinKeys(QObject *parent) : QObject(parent) {

	pSeed = new data_chunk(16);
	pseudo_random_fill(*pSeed);
	ALOG_SYSTEM << "Seed:" << QString::fromStdString(encode_base16(*pSeed));

	ec_secret oSecret = sha256_hash(*pSeed);
	pSecret = &oSecret;
	ALOG_SYSTEM << "Secret:" << *pSecret->data();

	ALOG_SYSTEM << "ABitcoinKeys created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABitcoinKeys::~ABitcoinKeys(void) {

	ALOG_SYSTEM << "ABitcoinKeys deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ABitcoinKeys::mShowKeys(void) {

	ALOG_SYSTEM << "Showing keys";

	this->mShowKey(pLTC);
	this->mShowKey(pDOGE);
	this->mShowKey(pDASH);
}


// -----------
/*!
	\fn

	Doc.
*/

void ABitcoinKeys::mShowKey(short inAltcoin) {

	wallet::ec_private oPrivateKey(*pSecret,inAltcoin);
	ALOG_SYSTEM << "WIF:" << QString::fromStdString(oPrivateKey.encoded());
	ALOG_SYSTEM << "Payment Address:" << QString::fromStdString(oPrivateKey.to_payment_address().encoded());
}
