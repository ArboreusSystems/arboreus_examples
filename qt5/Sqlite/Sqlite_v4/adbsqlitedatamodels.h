// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 15:16:03
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADBSQLITEDATAMODELS_H
#define ADBSQLITEDATAMODELS_H

// System includes
#include <QString>

// Application includes

// Constants and defintions

// Namespace
struct ADbSqliteProperties {

	QString Name = "NoDbName";
	QString Path = "NoDbPath";

	ADbSqliteProperties() {}
};


#endif // ADBSQLITEDATAMODELS_H
