// ----------------------------------------------------------
/*!
	\headerfile ANetwork
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

#ifndef ANEURON_H
#define ANEURON_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>
#include <NN/aconnection.h>

// Namespace


// Class definitions
class ANeuron {

	public:

		explicit ANeuron(void);
		virtual ~ANeuron(void);

	private:

		double pOutputValue = 0.0;
		vector<double> pWeights = {};
};

// Definitions
typedef vector<ANeuron> ANLayer;

#endif // ANEURON_H
