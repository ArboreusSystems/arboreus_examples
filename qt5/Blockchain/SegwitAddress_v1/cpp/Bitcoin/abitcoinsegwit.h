// ----------------------------------------------------------
/*!
	\headerfile ABitcoinSegwit
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2020 at 22:48:01
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABITCOINSEGWIT_H
#define ABITCOINSEGWIT_H

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
class ABitcoinSegwit : public QObject {

	Q_OBJECT

	public:

		explicit ABitcoinSegwit(QObject* parent = nullptr);
		virtual ~ABitcoinSegwit(void);

		ec_compressed mGetPublicKey();
		operation::list mWitnessProgram(ec_compressed inPublicKey);

	public slots:

		QString mGetSegwitAddress(void);

};

#endif // ABITCOINSEGWIT_H
