// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 16:28:06
	\endlist
*/
// ----------------------------------------------------------
#ifndef ANETWORKDATAMODELS_H
#define ANETWORKDATAMODELS_H

// System includes
#include <QString>
#include <QMap>

// Application includes

// Constants and defintions

// Namespace

struct ANetworkRequestProperties {

	QString URL = QString("NoDefinedURL");
	QMap<QString,QString> Headers = {};
};

#endif // ANETWORKDATAMODELS_H
