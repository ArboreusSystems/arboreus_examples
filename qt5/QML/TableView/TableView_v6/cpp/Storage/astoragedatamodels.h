// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 20:44:13
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTORAGEDATAMODELS_H
#define ASTORAGEDATAMODELS_H

// System includes
#include <QString>
#include <QVariantMap>

// Application includes

// Constants and defintions
#define _A_ENUM_DB_DATATYPE AEnumsDBDataType::DBDataType

// Namespace

class AEnumsDBDataType: public QObject {

	Q_OBJECT

	public:

		enum class DBDataType: int {

			Undefined,Integer,Text,Blob
		};
		Q_ENUM(DBDataType)
};


class ADBRequestAddModel {

	public:

		QString Color = "NoDefinedColor";
		QString Text = "NoDefinedText";

		explicit ADBRequestAddModel(void) {}
		virtual ~ADBRequestAddModel(void) {}
};

class ADBFieldInfo {

	public:

		int CID = 0;
		QString Name = "NoFieldName";
		_A_ENUM_DB_DATATYPE Type = _A_ENUM_DB_DATATYPE::Undefined;
		bool NotNULL = false;
		QVariant DefaultValue;
		bool PrimaryKey = false;

		QVariantMap mToVariantMap(void) {

			QVariantMap oOutput;

			oOutput.insert("Name",this->Name);
			oOutput.insert("Type",QVariant::fromValue(this->Type));
			oOutput.insert("NotNULL",this->NotNULL);
			oOutput.insert("DefaultValue",this->DefaultValue);
			oOutput.insert("PrimaryKey",this->PrimaryKey);

			return oOutput;
		}

		void mSetDataType(QString inTypeDescription) {

			if (QString::compare(inTypeDescription,"INTEGER")) {
				this->Type = _A_ENUM_DB_DATATYPE::Integer;
			} else if (QString::compare(inTypeDescription,"TEXT")) {
				this->Type = _A_ENUM_DB_DATATYPE::Text;
			} else if (QString::compare(inTypeDescription,"BLOB")) {
				this->Type = _A_ENUM_DB_DATATYPE::Blob;
			}
		}
};

#endif // ASTORAGEDATAMODELS_H
