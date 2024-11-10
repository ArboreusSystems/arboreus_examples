// ----------------------------------------------------------
/*!
	\class ANetwork
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
#include "anetwork.h"


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::ANetwork(void) {

	ALOG << "ANetwork created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::ANetwork(const vector<unsigned int>& inTopology) {

	unsigned oLayersCount = inTopology.size();
	for (unsigned iLayerNumber = 0; iLayerNumber < oLayersCount; ++ iLayerNumber) {

		pLayers.push_back(ANLayer());
		ALOG << "Initiated layer" << endl;

		for (unsigned iNeuronNumber = 0; iNeuronNumber <= inTopology[iLayerNumber]; ++iNeuronNumber) {
			pLayers.back().push_back(ANeuron());
			ALOG << "Neuron initiated in layer: " << iLayerNumber << " with number: " << iNeuronNumber << endl;
		}
	}

	ALOG << "ANetwork created with topology" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::~ANetwork(void) {

	ALOG << "ANetwork deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mLoadData(const vector<double>& inData) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mPropagateData(const vector<double>& inTargetData) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mResultData(vector<double>& inResultData) {

}
