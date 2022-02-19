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

ABitcoinKeys::ABitcoinKeys(uint8_t inSeedLength, QObject* parent) : QObject(parent) {

	pSeedLength = inSeedLength;
	this->mInit();

	ALOG_SYSTEM << "ABitcoinKeys created with seed length:" << inSeedLength;
}


// -----------
/*!
	\fn

	Doc.
*/

ABitcoinKeys::ABitcoinKeys(QObject *parent) : QObject(parent) {

	this->mInit();

	ALOG_SYSTEM << "ABitcoinKeys created with default seed length: 16";
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

void ABitcoinKeys::mInit(void) {

	pSeed = new data_chunk(pSeedLength);
	pseudo_random_fill(*pSeed);
	ALOG_SYSTEM << "Seed:" << this->mGetSeed();

	wallet::word_list oMnemonic = wallet::create_mnemonic(*pSeed);
	pMnemonic = &oMnemonic;
	if (wallet::validate_mnemonic(*pMnemonic)) {
		ALOG_SYSTEM << "Mnemonic:" << this->mGetMnemonic();
	} else {
		ALOG_SYSTEM << "Error! Wrong mnemonic";
	}

	pMasterPrivateKey = new wallet::hd_private(*pSeed);
	ALOG_SYSTEM << "MasterPrivateKey:" << this->mGetMasterPrivateKey();

	wallet::hd_key oMasterPrivateKeyHEX = pMasterPrivateKey->to_hd_key();
	pMasterPrivateKeyHEX = &oMasterPrivateKeyHEX;
	ALOG_SYSTEM << "MasterPrivateKeyHEX:" << this->mGetMasterPrivateKeyHEX();

	wallet::hd_public oMasterPublicKey = pMasterPrivateKey->to_public();
	pMasterPublicKey = &oMasterPublicKey;
	ALOG_SYSTEM << "MasterPublickKey:" << this->mGetMasterPublicKey();

	wallet::hd_private oChildPrivateKey = pMasterPrivateKey->derive_private(1);
	pChildPrivateKey = &oChildPrivateKey;
	ALOG_SYSTEM << "ChildPrivateKey:" << this->mGetChildPrivateKey();

	wallet::hd_public oChildPublicKey = pMasterPrivateKey->derive_public(1);
	pChildPublicKey = &oChildPublicKey;
	ALOG_SYSTEM << "ChildPublicKey:" << this->mGetChildPublicKey();
}


// -----------
/*!
	\fn

	Doc.
*/

void ABitcoinKeys::mResetKeys(void) {

	ALOG_SYSTEM << "Resetting keys";
	this->mInit();
	emit sgResetKeys();
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetSeed(void) {

	return QString::fromStdString(encode_base16(*pSeed));
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetMnemonic(void) {

	QString oOutput = "";
	for (auto &iWord : *pMnemonic) {
		oOutput += QString::fromStdString(iWord);
		oOutput += " ";
	}
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetMasterPrivateKey(void) {

	return QString::fromStdString(pMasterPrivateKey->encoded());
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetMasterPrivateKeyHEX(void) {

	return QString::fromStdString(encode_base16(*pMasterPrivateKeyHEX));
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetMasterPublicKey(void) {

	return QString::fromStdString(pMasterPublicKey->encoded());
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetChildPrivateKey(void) {

	return QString::fromStdString(pChildPrivateKey->encoded());
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinKeys::mGetChildPublicKey(void) {

	return QString::fromStdString(pChildPublicKey->encoded());
}
