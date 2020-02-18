// ----------------------------------------------------------
/*!
	\class ARandom
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 21:05:53
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "arandom.h"

using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

ARandom::ARandom(void) {}


// -----------
/*!
	\fn

	Doc.
*/

ARandom::~ARandom(void) {}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumber(void) {

	mt19937_64 oNumber(chrono::steady_clock::now().time_since_epoch().count());
	return oNumber();
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberPositive(ARandomExponent inExponent) {

	long long oNumber = mNumber();
	switch (inExponent) {
		case ARandomExponent::Deca: oNumber = oNumber % A_NUMBER_DECA; break;
		case ARandomExponent::Hecto: oNumber = oNumber % A_NUMBER_HECTO; break;
		case ARandomExponent::Kilo: oNumber = oNumber % A_NUMBER_KILO; break;
		case ARandomExponent::Mega: oNumber = oNumber % A_NUMBER_MEGA; break;
		case ARandomExponent::Giga: oNumber = oNumber % A_NUMBER_GIGA; break;
		case ARandomExponent::Tera: oNumber = oNumber % A_NUMBER_TERA; break;
		case ARandomExponent::Peta: oNumber = oNumber % A_NUMBER_PETA; break;
		case ARandomExponent::Exa: oNumber = oNumber % A_NUMBER_EXA; break;
		default: break;
	}
	if (oNumber < 0) {return oNumber * (-1);}
	return oNumber;
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberNegative(ARandomExponent inExponent) {

	return mNumberPositive(inExponent) * (-1);
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberFromRange(long long inNumber1, long long inNumber2) {

	long long oMaximum = inNumber1;
	long long oMinimum = inNumber2;

	if (inNumber1 < inNumber2) {
		oMaximum = inNumber2;
		oMinimum = inNumber1;
	}

	return oMinimum + abs(mNumber() % (oMaximum - oMinimum));
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberNoExponent(void) {

	if (ARandom::mNumber() % 2) {
		return mNumberNegative(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
	} else {
		return mNumberPositive(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
	}
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberPositiveNoExponent(void) {

	return ARandom::mNumberPositive(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberNegativeNoExponent(void) {

	return ARandom:: mNumberNegative(static_cast<ARandomExponent>(mNumberFromRange(0,7)));
}


// -----------
/*!
	\fn

	Doc.
*/

vector<long long> ARandom::mList(ARandomDictionaryType inType, long long inLength) {

	vector<long long> oDictionary = {};
	long long oIterator = 0;

	switch (inType) {
		case ARandomDictionaryType::Negative:
			for (; oIterator < inLength; oIterator++) {
				oDictionary.push_back(mNumberNegativeNoExponent());
			}
			break;
		case ARandomDictionaryType::Positive:
			for (; oIterator < inLength; oIterator++) {
				oDictionary.push_back(mNumberPositiveNoExponent());
			}
			break;
		default:
			for (; oIterator < inLength; oIterator++) {
				oDictionary.push_back(mNumberNoExponent());
			}
			break;
	}

	return oDictionary;
}


// -----------
/*!
	\fn

	Doc.
*/

vector<long long> ARandom::mUniqueList(ARandomDictionaryType inType, long long inLength) {

	vector<long long> oDictionary = {};
	long long oIterator = 0;
	long long oNumber = 0;

	while (oIterator != inLength) {
		switch (inType) {
			case ARandomDictionaryType::Negative:
				oNumber = mNumberNegativeNoExponent();
				break;
			case ARandomDictionaryType::Positive:
				oNumber = mNumberPositiveNoExponent();
				break;
			default:
				oNumber = mNumberNoExponent();
				break;
		}
		if (oDictionary.end() == find(oDictionary.begin(),oDictionary.end(),oNumber)) {
			oDictionary.push_back(oNumber);
			oIterator++;
		}
	}

	return oDictionary;
}

