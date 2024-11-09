// ----------------------------------------------------------
/*!
	\headerfile AComplexNumber
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 08:30:50
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACOMPLEXNUMBER_H
#define ACOMPLEXNUMBER_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>

// Namespace
using namespace std;


// Class definitions
class AComplexNumber {

	public:

		explicit AComplexNumber(void);
		explicit AComplexNumber(double inReal,double inImaginary);

		AComplexNumber(const AComplexNumber& inObject);
		const AComplexNumber& operator=(const AComplexNumber& inObject);
		AComplexNumber operator+(const AComplexNumber& inObject);
		AComplexNumber operator-(const AComplexNumber& inObject);

		virtual ~AComplexNumber(void);

		double mGetReal(void) const;
		void mSetReal(double inReal);
		double mGetImaginary(void) const;
		void mSetImaginary(double inImaginary);

	private:

		double pReal = 0.0;
		double pImaginary = 0.0;
};

ostream& operator<<(ostream& inOut, const AComplexNumber& inComplexNumber);

#endif // ACOMPLEXNUMBER_H
