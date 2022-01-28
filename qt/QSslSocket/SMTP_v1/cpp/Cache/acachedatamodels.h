// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/01/2022 at 18:30:39
	\endlist
*/
// ----------------------------------------------------------
#ifndef ACACHEDATAMODELS_H
#define ACACHEDATAMODELS_H

// System includes
#include <QVariant>
#include <QVariantMap>

// Application includes

// Constants and defintions

// Namespace

class ACacheReply {

	public:

		bool Status = false;
		QVariant Data;

		QVariantMap mToVariantMap(void) {

			QVariantMap oOutput = {};
			oOutput.insert("Status",Status);
			oOutput.insert("Data",Data);
			return oOutput;
		}
};

#endif // ACACHEDATAMODELS_H
