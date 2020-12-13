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

	pSettings = settings(config::settings::mainnet);

	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "Computed properties:";
	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "max_money():" << pSettings.max_money();
	ALOG_SYSTEM << "initial_subsidy():" << pSettings.initial_subsidy();
	ALOG_SYSTEM << "minimum_timespan():" << pSettings.minimum_timespan();
	ALOG_SYSTEM << "maximum_timespan():" << pSettings.maximum_timespan();
	ALOG_SYSTEM << "retargeting_interval():" << pSettings.retargeting_interval();

	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "Consensus settings:";
	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "retargeting_factor:" << pSettings.retargeting_factor;
	ALOG_SYSTEM << "retargeting_interval_seconds:" << pSettings.retargeting_interval_seconds;
	ALOG_SYSTEM << "block_spacing_seconds:" << pSettings.block_spacing_seconds;
	ALOG_SYSTEM << "timestamp_limit_seconds:" << pSettings.timestamp_limit_seconds;
	ALOG_SYSTEM << "proof_of_work_limit:" << pSettings.proof_of_work_limit;
	ALOG_SYSTEM << "initial_subsidy_bitcoin:" << pSettings.initial_subsidy_bitcoin;
	ALOG_SYSTEM << "subsidy_interval_blocks:" << pSettings.subsidy_interval_blocks;
	ALOG_SYSTEM << "genesis_block:" << &pSettings.genesis_block;

	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "Fork settings:";
	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "first_version:" << pSettings.first_version;
	ALOG_SYSTEM << "bip34_version:" << pSettings.bip34_version;
	ALOG_SYSTEM << "bip66_version:" << pSettings.bip66_version;
	ALOG_SYSTEM << "bip65_version:" << pSettings.bip65_version;
	ALOG_SYSTEM << "bip9_version_bit0:" << pSettings.bip9_version_bit0;
	ALOG_SYSTEM << "bip9_version_bit1:" << pSettings.bip9_version_bit1;
	ALOG_SYSTEM << "bip9_version_base:" << pSettings.bip9_version_base;

	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "Activation parameters (bip34-style activations):";
	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "activation_threshold:" << pSettings.activation_threshold;
	ALOG_SYSTEM << "enforcement_threshold:" << pSettings.enforcement_threshold;
	ALOG_SYSTEM << "activation_sample:" << pSettings.activation_sample;

	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "Frozen activation heights (frozen_activations):";
	ALOG_SYSTEM << "-------------------";
	ALOG_SYSTEM << "bip65_freeze:" << pSettings.bip65_freeze;
	ALOG_SYSTEM << "bip66_freeze:" << pSettings.bip66_freeze;
	ALOG_SYSTEM << "bip34_freeze:" << pSettings.bip34_freeze;
	ALOG_SYSTEM << "bip16_activation_time:" << pSettings.bip16_activation_time;

	ALOG_SYSTEM << "-------------------";
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


// -----------
/*!
	\fn

	Doc.
*/

QString ABitcoin::mGetSatoshiWord(void) {

	const chain::block oBlock = pSettings.genesis_block;
	const auto& oCoinbase = oBlock.transactions().front();
	const auto& oInput = oCoinbase.inputs().front();
	BITCOIN_ASSERT_MSG(oInput.script().size() > 2u, "unexpected genesis");

	const auto oHeadline = oInput.script()[2].data();
	std::string oMessage(oHeadline.begin(), oHeadline.end());

	return QString::fromStdString(oMessage);
}
