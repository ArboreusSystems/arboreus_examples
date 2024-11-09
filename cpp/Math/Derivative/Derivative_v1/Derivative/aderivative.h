// ----------------------------------------------------------
/*!
	\headerfile ADerivative
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

#ifndef ADERIVATIVE_H
#define ADERIVATIVE_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>

// Namespace
using namespace std;

// Definitions
typedef function<double(double)> AFunction;
typedef function<double(function<double(double)>,double)> AFunctionDerivative;


// Class definitions
class ADerivative {

	public:

		explicit ADerivative(void);
		virtual ~ADerivative(void);

		double mNewtonsMethod(
			AFunction inFunction,AFunctionDerivative inDerivative, double inX0, double inPrecision
		);

};

#endif // ADERIVATIVE_H
