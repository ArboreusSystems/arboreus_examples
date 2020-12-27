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

//	data_chunk seedChunk(16);
//	std::cout << "\nHex Seed: " << std::endl;
//	std::cout << encode_base16(seedChunk)<< std::endl;
//	pseudo_random_fill(seedChunk);
//	std::cout << "\nHex Seed: " << std::endl;
//	std::cout << encode_base16(seedChunk)<< std::endl;

//	wallet::word_list writtenWord = wallet::create_mnemonic(seedChunk);
//	if (wallet::validate_mnemonic(writtenWord)) {
//		AWordListDataModel oWordList(writtenWord);
//		ALOG_SYSTEM << "Mnemonic string:" << oWordList.mToQString();
//	} else {
//		ALOG_SYSTEM << "Mnemonic invalid!";
//	}

//	wallet::hd_private privateKey(seedChunk);
//	std::cout << "\n\nMaster Private Key: " << std::endl;
//	std::cout << privateKey.encoded() << std::endl;

//	wallet::hd_key keys = privateKey.to_hd_key();
//	std::cout << "\nHex Master Private Key: " << std::endl;
//	std::cout << encode_base16(keys) << std::endl;

//	wallet::hd_public publicKey = privateKey.to_public();
//	std::cout << "\nMaster Public Key: " << std::endl;
//	std::cout << publicKey.encoded() << std::endl;

//	wallet::hd_private childPrivateKey = privateKey.derive_private(1);
//	std::cout << "\nChild Private Key: " << std::endl;
//	std::cout << childPrivateKey.encoded() << std::endl;

//	wallet::hd_public childPublicKey = privateKey.derive_public(1);
//	std::cout << "\nChild Public Key: " << std::endl;
//	std::cout << publicKey.encoded() << std::endl;

//	std::cout << "\nPayment Adress: " << std::endl;
//	std::cout << wallet::ec_public(childPublicKey.point()).to_payment_address().encoded()<< "\n" << std::endl;

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
