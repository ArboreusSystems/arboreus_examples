// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:43:54
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASESSIONDATAMODELS_H
#define ASESSIONDATAMODELS_H

// System includes
#include <QVariant>
#include <QVariantMap>

// Application includes

// Constants and defintions

// Namespace

class ACacheReply {

	public:

		bool Status = false;
		QVariant Value;

		QVariantMap mToVariantMap(void) {

			QVariantMap oOutput = {};
			oOutput.insert("Status",Status);
			oOutput.insert("Value",Value);
			return oOutput;
		}
};


#endif // ASESSIONDATAMODELS_H
