// ----------------------------------------------------------
/*!
	\headerfile ABitcoin
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/12/2020 at 23:29:51
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABITCOIN_H
#define ABITCOIN_H

// System includes
#include <QObject>
#include <QString>
#include <stdio.h>
#include <bitcoin/system.hpp>

// Application includes
#include "../Main/alogger.h"
#include "abitcoinkeys.h"


// Constants and definitions

// Namespace
using namespace libbitcoin::system;
using namespace libbitcoin;
using namespace libbitcoin::system::wallet;
using namespace libbitcoin::system::machine;
using namespace libbitcoin::system::chain;
using namespace std;

// Class definitions
class ABitcoin : public QObject {

	Q_OBJECT

	public:

		ABitcoinKeys* pKeys = nullptr;

		explicit ABitcoin(QObject* parent = nullptr);
		virtual ~ABitcoin(void);

	public slots:


	private:

		settings* pSettings;
};

#endif // ABITCOIN_H
