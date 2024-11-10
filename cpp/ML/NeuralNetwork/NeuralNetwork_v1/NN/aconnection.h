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

#ifndef ACONNECTION_H
#define ACONNECTION_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>

// Namespace


// Class definitions
class AConnection {

	public:

		double pWeight = 0.0;
		double pDeltaWeight = 0.0;

		AConnection(void);
		~AConnection(void);
};

#endif // ACONNECTION_H
