// ----------------------------------------------------------
/*!
	\class ABitcoinSegwit
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2020 at 22:48:01
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abitcoinsegwit.h"


// -----------
/*!
	\fn

	Doc.
*/

ABitcoinSegwit::ABitcoinSegwit(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ABitcoinSegwit created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABitcoinSegwit::~ABitcoinSegwit(void) {

	ALOG_SYSTEM << "ABitcoinSegwit deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ec_compressed ABitcoinSegwit::mGetPublicKey(void) {

	std::string oMnemonic = "portion shop border uniform loan grab dismiss boss wild magnet strong supreme era swing else keep voyage forest";
	data_chunk oSeed = to_chunk(decode_mnemonic(split(oMnemonic)));
	hd_private oPrivateKey = hd_private(oSeed, hd_private::testnet);
	ec_compressed oCompressedPublicKey = oPrivateKey.to_public().point();
	return oCompressedPublicKey;
}


// -----------
/*!
	\fn

	Doc.
*/

operation::list ABitcoinSegwit::mWitnessProgram(ec_compressed inPublicKey) {

	short_hash oKeyHash = bitcoin_short_hash(inPublicKey);
	return {operation(opcode(0)), operation(to_chunk(oKeyHash))};
}


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoinSegwit::mGetSegwitAddress(void) {

	ALOG_SYSTEM << "Getting Segwit Address.";

	QString oOutput = "";

	script oP2WPKH = script(this->mWitnessProgram(this->mGetPublicKey()));
	short_hash oWitnessProgramHash = bitcoin_short_hash(oP2WPKH.to_data(0));
	script oP2SH_P2WPKH = script::to_pay_script_hash_pattern(oWitnessProgramHash);
	oOutput = QString::fromStdString(
		payment_address(oP2WPKH, payment_address::testnet_p2sh).encoded()
	);
//	script* P2WPKH = new script(pWitnessList);
//	ALOG_SYSTEM << "Witness program (P2WPKH):" << QString::fromStdString(P2WPKH->to_string(0));

	return oOutput;
}
