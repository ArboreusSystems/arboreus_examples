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
#include <QVariant>
#include <QVariantList>
#include <QVariantMap>

// Application includes

// Constants and defintions
#define A_DB_NULL_VALUE "A_DB_NULL_VALUE"
#define _A_ENUM_SQL_DATA_TYPE AEnumsSQLDataType::SQLDataType

// Namespace

class AEnumsSQLDataType : public QObject {

	Q_OBJECT

	public:

		enum class SQLDataType: int {

			Undefined, Null, Integer, Real, Text, Blob
		};
		Q_ENUM(SQLDataType)

		explicit AEnumsSQLDataType(QObject* parent) : QObject(parent) {}
		virtual ~AEnumsSQLDataType(void) {}
};

class ADBSqlCipherProperties {

	public:

		QString Name = QString("NoName");
		QString Path = QString("NoPath");
		QString Value = QString(A_DB_NULL_VALUE);

		explicit ADBSqlCipherProperties(void) {}
		virtual ~ADBSqlCipherProperties(void) {}
};

class ADBSqlCipherReply {

	public:

		bool Status = false;
		QVariantList Output = {};

		ADBSqlCipherReply(void) {}
		virtual ~ADBSqlCipherReply(void) {}
};

class ADBSqliteFieldInfo {

	public:

		long long CID = 0;
		QString Name = "NoFieldName";
		_A_ENUM_SQL_DATA_TYPE Type = _A_ENUM_SQL_DATA_TYPE::Undefined;
		bool NotNull = true;
		QVariant DefaultValue;
		bool PrimaryKey = false;

		ADBSqliteFieldInfo(void) {}
		virtual ~ADBSqliteFieldInfo(void) {}

		QVariantMap mToVariantMap(void) {

			QVariantMap oOutput = {};

			oOutput.insert("CID",this->CID);
			oOutput.insert("Name",this->Name);
			oOutput.insert("Type",QVariant::fromValue(this->Type));
			oOutput.insert("NotNull",this->NotNull);
			oOutput.insert("DefaultValue",this->DefaultValue);
			oOutput.insert("PrimaryKey",this->PrimaryKey);

			return oOutput;
		}

		void mSetType(QString inType) {

			if (QString::compare("INTEGER",inType,Qt::CaseInsensitive)) {
				this->Type = _A_ENUM_SQL_DATA_TYPE::Integer;
			} else if (QString::compare("NULL",inType,Qt::CaseInsensitive)) {
				this->Type = _A_ENUM_SQL_DATA_TYPE::Null;
			} else if (QString::compare("TEXT",inType,Qt::CaseInsensitive)) {
				this->Type = _A_ENUM_SQL_DATA_TYPE::Text;
			} else if (QString::compare("REAL",inType,Qt::CaseInsensitive)) {
				this->Type = _A_ENUM_SQL_DATA_TYPE::Real;
			} else if (QString::compare("BLOB",inType,Qt::CaseInsensitive)) {
				this->Type = _A_ENUM_SQL_DATA_TYPE::Blob;
			}
		}
};

#endif // ADBDATAMODELS_H
