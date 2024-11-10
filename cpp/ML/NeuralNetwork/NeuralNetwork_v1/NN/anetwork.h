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

#ifndef ANETWORK_H
#define ANETWORK_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>
#include "aneuron.h"

// Namespace


// Class definitions
class ANetwork {

	public:

		explicit ANetwork(void);
		explicit ANetwork(const vector<unsigned>& inTopology);
		virtual ~ANetwork(void);

		void mLoadData(const vector<double>& inInputData);
		void mPropagateData(const vector<double>& inTargetData);
		void mResultData(vector<double>& inResultData);

	private:

		vector<ANLayer> pLayers = {};
};

#endif // ANETWORK_H
