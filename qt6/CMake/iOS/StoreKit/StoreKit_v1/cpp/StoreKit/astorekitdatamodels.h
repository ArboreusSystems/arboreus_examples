// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 10:50:15
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTOREKITDATAMODELS_H
#define ASTOREKITDATAMODELS_H

// System includes

// Precompile includes
#include <astorekitpch.h>

// Application includes
#include <astorekitconfiginterface.h>

// Constants and defintions

// Namespace

struct AStorekitServiceProperties {

	QObject* pConfig = nullptr;
};

Q_DECLARE_METATYPE(AStorekitServiceProperties)

#endif // ASTOREKITDATAMODELS_H
