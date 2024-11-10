/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/11/2024 at 08:24:13
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <Logger/alogger.h>
#include <NN/anetwork.h>

// Namespace
using namespace std;


// Console Application
int main(int inCounter, char* inArguments[]) {

	vector<unsigned> oTopology;
	oTopology.push_back(3);
	oTopology.push_back(2);
	oTopology.push_back(1);
	ANetwork oNetwork(oTopology);

	vector<double> oInputData;
	oNetwork.mLoadData(oInputData);

	vector<double> oTargetData;
	oNetwork.mPropagateData(oTargetData);

	vector<double> oResultData;
	oNetwork.mResultData(oResultData);


	ALOG << "NeuralNetwork_v1" << endl;

	return 0;
}
