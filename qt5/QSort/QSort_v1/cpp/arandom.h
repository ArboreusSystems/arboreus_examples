// ----------------------------------------------------------
/*!
	\headerfile ARandom
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 15/10/2021 at 20:56:36
	\endlist
*/
// ----------------------------------------------------------

#ifndef ARANDOM_H
#define ARANDOM_H

// System includes
#include <QObject>
#include <QVector>
#include <algorithm>
#include <chrono>
#include <random>
#include <vector>

// Application includes
#include <arandomdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ARandom : public QObject {

	Q_OBJECT

	public:

		explicit ARandom(QObject *parent = nullptr);
		virtual ~ARandom(void);

		static long long mNumber(void);
		static long long mNumberPositive(_A_ENUMS_RANDOM_EXPONENT inExponent);
		static long long mNumberNegative(_A_ENUMS_RANDOM_EXPONENT inExponent);
		static long long mNumberFromRange(long long inNumber1, long long inNumber2);
		static long long mNumberNoExponent(void);
		static long long mNumberPositiveNoExponent(void);
		static long long mNumberNegativeNoExponent(void);
		static QVector<long long> mList(_A_ENUMS_RANDOM_DICTIONARY_TYPE inType, long long inLength);
		static QVector<long long> mUniqueList(_A_ENUMS_RANDOM_DICTIONARY_TYPE inType, long long inLength);
};

#endif // ARANDOM_H
