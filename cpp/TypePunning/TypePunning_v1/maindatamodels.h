// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/07/2020 at 14:21:56
	\endlist
*/
// ----------------------------------------------------------
#ifndef MAINDATAMODELS_H
#define MAINDATAMODELS_H

// System includes

// Application includes

// Constants and defintions
struct ACordinates {

	int pX;
	int pY;

	int* mGetArray() {

		return &pX;
	}
};

#endif // MAINDATAMODELS_H
