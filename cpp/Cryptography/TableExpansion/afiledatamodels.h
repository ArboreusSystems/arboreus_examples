// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 22:59:24
	\endlist
*/
// ----------------------------------------------------------
#ifndef AFILEDATAMODELS_H
#define AFILEDATAMODELS_H

// System includes

// Application includes

// Constants and defintions

union ANumberUnion {
	unsigned char Byte[8];
	long long Number;
};

#endif // AFILEDATAMODELS_H
