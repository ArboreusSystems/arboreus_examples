// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 21:06:48
	\endlist
*/
// ----------------------------------------------------------
#ifndef ARANDOMDATAMODELS_H
#define ARANDOMDATAMODELS_H

// System includes

// Application includes

// Constants and defintions
#define A_NUMBER_DECA 10
#define A_NUMBER_HECTO 100
#define A_NUMBER_KILO 1000
#define A_NUMBER_MEGA 1000000
#define A_NUMBER_GIGA 1000000000
#define A_NUMBER_TERA 1000000000000
#define A_NUMBER_PETA 1000000000000000
#define A_NUMBER_EXA 1000000000000000000

enum ARandomDictionaryType: int {

	Free = 0,
	Positive = 1,
	Negative = 2
};

enum ARandomExponent: int {

	Deca = 0,
	Hecto = 1,
	Kilo = 2,
	Mega = 3,
	Giga = 4,
	Tera = 5,
	Peta = 6,
	Exa = 7,
	Full = 8
};

#endif // ARANDOMDATAMODELS_H
