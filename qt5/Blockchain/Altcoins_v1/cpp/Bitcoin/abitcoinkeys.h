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
using namespace bc;
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

		explicit ABitcoinKeys(QObject *parent = nullptr);
		virtual ~ABitcoinKeys(void);

	public slots:

		void mShowKeys(void);

	private:

		data_chunk* pSeed = nullptr;
		ec_secret* pSecret = nullptr;

		short pLTC = 0xB030;
		short pDOGE = 0x9E1E;
		short pDASH = 0xCC4C;

		void mShowKey(short inAltcoin);
};

#endif // ABITCOINKEYS_H
