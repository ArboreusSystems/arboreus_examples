// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2022 at 12:38:25
	\endlist
*/
// ----------------------------------------------------------
#ifndef AUNIVERSALDATAMODELS_H
#define AUNIVERSALDATAMODELS_H

// System includes
#include <QObject>
#include <QVariant>
#include <QJsonObject>

// Application includes

// Constants and defintions
#define _A_ENUM_DICTIONARY_TYPE AEnumsDictionaryType::DictionaryType
#define _A_ENUM_REPLY_STATUS AEnumsStatus::Status

// Namespace

class AEnumsStatus: public QObject {

	Q_OBJECT

	public:

		enum class Status: int {

			Error, Ok, Existed, NotExisted,
			WrongProperties, WrongValue,
			NoField
		};
		Q_ENUM(Status)
};

class AJsonFileReply {

	public:

		_A_ENUM_REPLY_STATUS Status = _A_ENUM_REPLY_STATUS::Error;
		QJsonObject Json;
};

class AJsonFieldReply {

	public:

		_A_ENUM_REPLY_STATUS Status = _A_ENUM_REPLY_STATUS::Error;
		QVariant Value;
};

class AEnumsDictionaryType: public QObject {

	Q_OBJECT

	public:

		enum class DictionaryType: int {

			AlphaLower, AlphaUpper, Alpha, AlphaLowerNumeric,
			AlphaUpperNumeric, AlphaNumeric, Symbols,
			Numeric
		};
		Q_ENUM(DictionaryType)
};


#endif // AUNIVERSALDATAMODELS_H
