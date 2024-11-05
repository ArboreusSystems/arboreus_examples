// ----------------------------------------------------------
/*!
	\headerfile AIntegral
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

#ifndef AINTEGRAL_H
#define AINTEGRAL_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include "../Logger/alogger.h"

// Namespace
using namespace std;


// Class definitions
class AIntegral {

	public:

		explicit AIntegral(void);
		virtual ~AIntegral(void);

		double mCalculate(double inBottomBound, double inTopBound, int inN);

	private:

		double mFunction(double inX);
};

#endif // AINTEGRAL_H
