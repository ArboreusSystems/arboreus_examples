// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2020 at 19:11:13
	\endlist
*/
// ----------------------------------------------------------
#ifndef ARANDOM_HPP
#define ARANDOM_HPP

// System includes
#include <algorithm>
#include <chrono>
#include <random>
#include <vector>

// Application includes
#include "aglobal.hpp"

// Constants and defintions
#define A_NUMBER_DECA 10
#define A_NUMBER_HECTO 100
#define A_NUMBER_KILO 1000
#define A_NUMBER_MEGA 1000000
#define A_NUMBER_GIGA 1000000000
#define A_NUMBER_TERA 1000000000000
#define A_NUMBER_PETA 1000000000000000
#define A_NUMBER_EXA 1000000000000000000

using namespace std;

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

class ARandom {

	public:

		static long long mNumber(void) {

			mt19937_64 oRange(chrono::steady_clock::now().time_since_epoch().count());
			return oRange();
		}

		static long long mNumberPositive(ARandomExponent inExponent) {

			long long oNumber = mNumber();
			switch (inExponent) {
				case ARandomExponent::Deca:
					oNumber = oNumber % A_NUMBER_DECA;
					break;
				case ARandomExponent::Hecto:
					oNumber =  oNumber % A_NUMBER_HECTO;
					break;
				case ARandomExponent::Kilo:
					oNumber =  oNumber % A_NUMBER_KILO;
					break;
				case ARandomExponent::Mega:
					oNumber = oNumber % A_NUMBER_MEGA;
					break;
				case ARandomExponent::Giga:
					oNumber = oNumber % A_NUMBER_GIGA;
					break;
				case ARandomExponent::Tera:
					oNumber = oNumber % A_NUMBER_TERA;
					break;
				case ARandomExponent::Peta:
					oNumber = oNumber % A_NUMBER_PETA;
					break;
				case ARandomExponent::Exa:
					oNumber = oNumber % A_NUMBER_EXA;
					break;
				default:
					break;
			}
			if (oNumber < 0) {return oNumber * (-1);}
			return oNumber;
		}

		static long long mNumberNegative(ARandomExponent inExponent) {

			return mNumberPositive(inExponent) * (-1);
		}

		static long long mNumberFromRange(long long inNumber1, long long inNumber2) {

			long long oMaximum = inNumber1;
			long long oMinimum = inNumber2;

			if (inNumber1 < inNumber2) {
				oMaximum = inNumber2;
				oMinimum = inNumber1;
			}

			return oMinimum + abs(mNumber() % (oMaximum - oMinimum));
		}

		static long long mNumberNoExponent(void) {

			if (mNumber() % 2) {
				return mNumberNegative(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
			} else {
				return mNumberPositive(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
			}
		}

		static long long mNumberPositiveNoExponent(void) {

			return mNumberPositive(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
		}

		static long long mNumberNegativeNoExponent(void) {

			return mNumberNegative(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
		}
};


#endif // ARANDOM_HPP
