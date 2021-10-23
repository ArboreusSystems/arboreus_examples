// ----------------------------------------------------------
/*!
	\class ARandom
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 15/10/2021 at 20:56:36
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "arandom.h"

// Namespace
using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

ARandom::ARandom(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ARandom::~ARandom(void) {

}


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

long long ARandom::mNumberPositive(_A_ENUMS_RANDOM_EXPONENT inExponent) {

	long long oNumber = mNumber();
	switch (inExponent) {
		case _A_ENUMS_RANDOM_EXPONENT::Deca: oNumber = oNumber % _A_NUMBER_DECA; break;
		case _A_ENUMS_RANDOM_EXPONENT::Hecto: oNumber = oNumber % _A_NUMBER_HECTO; break;
		case _A_ENUMS_RANDOM_EXPONENT::Kilo: oNumber = oNumber % _A_NUMBER_KILO; break;
		case _A_ENUMS_RANDOM_EXPONENT::Mega: oNumber = oNumber % _A_NUMBER_MEGA; break;
		case _A_ENUMS_RANDOM_EXPONENT::Giga: oNumber = oNumber % _A_NUMBER_GIGA; break;
		case _A_ENUMS_RANDOM_EXPONENT::Tera: oNumber = oNumber % _A_NUMBER_TERA; break;
		case _A_ENUMS_RANDOM_EXPONENT::Peta: oNumber = oNumber % _A_NUMBER_PETA; break;
		case _A_ENUMS_RANDOM_EXPONENT::Exa: oNumber = oNumber % _A_NUMBER_EXA; break;
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

long long ARandom::mNumberNegative(_A_ENUMS_RANDOM_EXPONENT inExponent) {

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
		return mNumberNegative(
			static_cast<_A_ENUMS_RANDOM_EXPONENT>(mNumberFromRange(0,7))
		);
	} else {
		return mNumberPositive(
			static_cast<_A_ENUMS_RANDOM_EXPONENT>(mNumberFromRange(0,7))
		);
	}
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberPositiveNoExponent(void) {

	return ARandom::mNumberPositive(
		static_cast<_A_ENUMS_RANDOM_EXPONENT>(mNumberFromRange(0,7))
	);
}


// -----------
/*!
	\fn

	Doc.
*/

long long ARandom::mNumberNegativeNoExponent(void) {

	return ARandom::mNumberNegative(
		static_cast<_A_ENUMS_RANDOM_EXPONENT>(mNumberFromRange(0,7))
	);
}


// -----------
/*!
	\fn

	Doc.
*/

QVector<long long> ARandom::mList(_A_ENUMS_RANDOM_DICTIONARY_TYPE inType, long long inLength) {

	QVector<long long> oDictionary = {};
	long long oIterator = 0;

	switch (inType) {
		case _A_ENUMS_RANDOM_DICTIONARY_TYPE::Negative:
			for (; oIterator < inLength; oIterator++) {
				oDictionary.push_back(mNumberNegativeNoExponent());
			}
			break;
		case _A_ENUMS_RANDOM_DICTIONARY_TYPE::Positive:
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

QVector<long long> ARandom::mUniqueList(_A_ENUMS_RANDOM_DICTIONARY_TYPE inType, long long inLength) {

	QVector<long long> oDictionary = {};
	long long oIterator = 0;
	long long oNumber = 0;

	while (oIterator != inLength) {
		switch (inType) {
			case _A_ENUMS_RANDOM_DICTIONARY_TYPE::Negative:
				oNumber = mNumberNegativeNoExponent();
				break;
			case _A_ENUMS_RANDOM_DICTIONARY_TYPE::Positive:
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

