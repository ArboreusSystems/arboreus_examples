// ----------------------------------------------------------
/*!
	\headerfile ABitcoinKeys
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2020 at 14:37:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABITCOINKEYS_H
#define ABITCOINKEYS_H

// System includes
#include <QObject>
#include <QString>
#include <bitcoin/system.hpp>

// Application includes
#include "../Main/alogger.h"

// Constants and definitions

// Namespace
using namespace libbitcoin::system;
using namespace libbitcoin;
using namespace libbitcoin::system::wallet;
using namespace libbitcoin::system::machine;
using namespace libbitcoin::system::chain;
using namespace std;

// Class definitions
class ABitcoinKeys : public QObject {

	Q_OBJECT

	public:

		data_chunk* pSeed = nullptr;
		wallet::word_list* pMnemonic = nullptr;
		wallet::hd_private* pMasterPrivateKey = nullptr;
		wallet::hd_key* pMasterPrivateKeyHEX = nullptr;
		wallet::hd_public* pMasterPublicKey = nullptr;
		wallet::hd_private* pChildPrivateKey = nullptr;
		wallet::hd_public* pChildPublicKey = nullptr;

		explicit ABitcoinKeys(uint8_t inSeedLength,QObject *parent = nullptr);
		explicit ABitcoinKeys(QObject *parent = nullptr);
		virtual ~ABitcoinKeys(void);

	signals:

		void sgResetKeys(void);

	public slots:

		void mResetKeys(void);

		QString mGetSeed(void);
		QString mGetMnemonic(void);
		QString mGetMasterPrivateKey(void);
		QString mGetMasterPrivateKeyHEX(void);
		QString mGetMasterPublicKey(void);
		QString mGetChildPrivateKey(void);
		QString mGetChildPublicKey(void);

	private:

		uint8_t pSeedLength = 16;

		void mInit(void);
};

#endif // ABITCOINKEYS_H
