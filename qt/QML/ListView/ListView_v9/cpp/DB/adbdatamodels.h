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

// Application includes

// Constants and defintions
#define A_DB_NULL_VALUE "A_DB_NULL_VALUE"

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

#endif // ADBDATAMODELS_H
