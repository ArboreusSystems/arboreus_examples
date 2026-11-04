// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2026 at 17:36:54
	\endlist
*/
// ----------------------------------------------------------

#ifndef AREVENUECATDATAMODELS_H
#define AREVENUECATDATAMODELS_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Constants and defintions

class ARevenueCatProduct {

	public:

		QString pID = QStringLiteral("Undefined");

		ARevenueCatProduct(void) {}
		~ARevenueCatProduct(void) {}

		QVariantList mToList(void) {

			QVariantList oOutput;
			return oOutput;
		}
};

#endif // AREVENUECATDATAMODELS_H
