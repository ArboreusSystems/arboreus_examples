// ----------------------------------------------------------
/*!
	\class AComplexNumber
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 08:30:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acomplexnumber.h"


// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber::AComplexNumber(void) {

	ALOG << "AComplexNumber created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber::AComplexNumber(double inReal, double inImaginary) {

	pReal = inReal;
	pImaginary = inImaginary;

	ALOG << "AComplexNumber created with numbers" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber::AComplexNumber(const AComplexNumber& inObject) {

	pReal = inObject.pReal;
	pImaginary = inObject.pImaginary;

	ALOG << "AComplexNumber created copy" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

const AComplexNumber& AComplexNumber::operator=(const AComplexNumber& inObject) {

	pReal = inObject.pReal;
	pImaginary = inObject.pImaginary;

	ALOG << "AComplexNumber '=' reloaded" << endl;

	return *this;
}

// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber AComplexNumber::operator+(const AComplexNumber& inObject) {

	AComplexNumber oOutput;
	oOutput.mSetReal(pReal + inObject.mGetReal());
	oOutput.mSetImaginary(pImaginary + inObject.pImaginary);

	ALOG << "AComplexNumber '+' reloaded" << endl;

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber AComplexNumber::operator-(const AComplexNumber& inObject) {

	AComplexNumber oOutput;
	oOutput.mSetReal(pReal - inObject.mGetReal());
	oOutput.mSetImaginary(pImaginary - inObject.pImaginary);

	ALOG << "AComplexNumber '-' reloaded" << endl;

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

AComplexNumber::~AComplexNumber(void) {

	ALOG << "AComplexNumber deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

double AComplexNumber::mGetReal(void) const {

	return pReal;
}


// -----------
/*!
	\fn

	Doc.
*/

void AComplexNumber::mSetReal(double inReal) {

	pReal = inReal;
}


// -----------
/*!
	\fn

	Doc.
*/

double AComplexNumber::mGetImaginary(void) const {

	return pImaginary;
}


// -----------
/*!
	\fn

	Doc.
*/

void AComplexNumber::mSetImaginary(double inImaginary) {

	pImaginary = inImaginary;
}


// -----------
/*!
	\fn

	Doc.
*/

ostream& operator<<(ostream& inOut, const AComplexNumber& inComplexNumber) {

	inOut << "(" << inComplexNumber.mGetReal() << "," << inComplexNumber.mGetImaginary() << ")";
	return inOut;
}
