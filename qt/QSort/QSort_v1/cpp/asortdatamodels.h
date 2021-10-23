// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/10/2021 at 00:39:21
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASORTDATAMODELS_H
#define ASORTDATAMODELS_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions
#define _A_ENUMS_SORT_DIRECTION AEnumsSortDirection::SortDirection

// Namespace

class AEnumsSortDirection: public QObject {

	Q_OBJECT

	public:

		enum class SortDirection: int {

			Ascending,
			Descending
		};
		Q_ENUM(SortDirection)
};

#endif // ASORTDATAMODELS_H
