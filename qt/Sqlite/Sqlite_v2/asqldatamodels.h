// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 16:26:52
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASQLDATAMODELS_H
#define ASQLDATAMODELS_H

// System includes
#include <QString>

// Application includes

// Constants and defintions

// Namespace

struct ASqlDatabaseProperties {

	QString Name = QString("NoName");
	QString Path = QString("NoPath");

	ASqlDatabaseProperties() {}
	~ASqlDatabaseProperties() {}
};

#endif // ASQLDATAMODELS_H
