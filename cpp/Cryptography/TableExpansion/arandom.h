// ----------------------------------------------------------
/*!
	\headerfile ARandom
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 21:05:53
	\endlist
*/
// ----------------------------------------------------------
#ifndef ARANDOM_H
#define ARANDOM_H

// System includes
#include <algorithm>
#include <chrono>
#include <random>
#include <vector>

// Application includes
#include "aglobal.h"
#include "arandomdatamodels.h"

// Constants and definitions

// Class definitions
class ARandom {

	public:

		ARandom(void);
		~ARandom(void);

		static long long mNumber(void);
		static long long mNumberPositive(ARandomExponent inExponent);
		static long long mNumberNegative(ARandomExponent inExponent);
		static long long mNumberFromRange(long long inNumber1, long long inNumber2);
		static long long mNumberNoExponent(void);
		static long long mNumberPositiveNoExponent(void);
		static long long mNumberNegativeNoExponent(void);
		static std::vector<long long> mList(ARandomDictionaryType inType, long long inLength);
		static std::vector<long long> mUniqueList(ARandomDictionaryType inType, long long inLength);
};

#endif // ARANDOM_H
