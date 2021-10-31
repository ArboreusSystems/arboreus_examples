// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 18:50:52
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADBDATAMODELS_H
#define ADBDATAMODELS_H

// System includes
#include <QObject>
#include <QString>
#include <QVariantList>
#include <QQmlEngine>

// Application includes

// Constants and defintions
#define A_DB_NULL_VALUE "A_DB_NULL_VALUE"

#define _A_ENUM_DB_DATATYPE AEnumsDBDataType::ADBDataType
#define _A_ENUM_DB_SORTING_DIRECTION AEnumsDBSortingDirection::ADBSortingDirection

// Namespace


class ADBSqlCipherProperties : public QObject {

	Q_OBJECT

	public:

		QString Name = QString("NoName");
		QString Path = QString("NoPath");
		QString Value = QString(A_DB_NULL_VALUE);

		explicit ADBSqlCipherProperties(QObject* parent = nullptr) : QObject(parent) {}
		virtual ~ADBSqlCipherProperties(void) {}
};

class ADBSqlCipherReply {

	public:

		bool Status = false;
		QVariantList Output = {};

		ADBSqlCipherReply(void) {}
		virtual ~ADBSqlCipherReply(void) {}
};

class AEnumsDBDataType: public QObject {

	Q_OBJECT

	public:

		enum class ADBDataType: int {

			Undefined,
			Integer,
			Text,
			Blob
		};
		Q_ENUM(ADBDataType)
};

class AEnumsDBSortingDirection: public QObject {

	Q_OBJECT

	public:

		enum class ADBSortingDirection: int {

			Ascendant,
			Descendant
		};
		Q_ENUM(ADBSortingDirection)
};

#endif // ADBDATAMODELS_H
