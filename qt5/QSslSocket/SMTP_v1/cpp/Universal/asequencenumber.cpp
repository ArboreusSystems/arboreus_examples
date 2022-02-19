// ----------------------------------------------------------
/*!
	\class ASequenceNumber
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2022 at 12:44:27
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asequencenumber.h"


// -----------
/*!
	\fn

	Doc.
*/

ASequenceNumber::ASequenceNumber(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ASequenceNumber::~ASequenceNumber(void) {}


// -----------
/*!
	\fn quint32 aNumber::mRandom(void)

	Return random long number.
*/

int ASequenceNumber::mRandom(void) {

	QRandomGenerator::securelySeeded();
	return QRandomGenerator::global()->generate();
}


// -----------
/*!
	\fn quint32 aNumber::mRandom(quint32 Number1,quint32 Number2)

	Return number from range betwenn Number1 and Number2.
*/

int ASequenceNumber::mRandom(int Number1,int Number2) {

	int Minor = 0;
	int Major = 0;

	if (Number1 > Number2) {
		Major = Number1; Minor = Number2;
	} else {
		Major = Number2; Minor = Number1;
	}

	QRandomGenerator::securelySeeded();
	return Minor + (QRandomGenerator::global()->generate() % (Major - Minor));
}


// -----------
/*!
	\fn

	Doc.
*/

int ASequenceNumber::mRandomPositive(void) {

	int oOutput = mRandom();
	if (oOutput < 0) oOutput = oOutput * (-1);
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

int ASequenceNumber::mRandomNegative(void) {

	int oOutput = mRandom();
	if (oOutput > 0) oOutput = oOutput * (-1);
	return oOutput;
}


