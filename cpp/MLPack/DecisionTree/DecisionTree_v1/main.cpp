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
#include "Logger/alogger.h"

// Namespace
using namespace std;
using namespace arma;
using namespace mlpack;


// Console Application
int main(int inCounter, char* inArguments[]) {

	mat oRandomDataMatrix(10,1000,fill::randu);
	rowvec oRandomResponsesVector = randn<rowvec>(1000);
	mat oRandomTestDataMatrix(10,500,fill::randu);

	DecisionTreeRegressor oRegressor;
	oRegressor.Train(oRandomDataMatrix,oRandomResponsesVector);

	rowvec oPredictionsVector;
	oRegressor.Predict(oRandomTestDataMatrix,oPredictionsVector);

	ALOG << accu(oPredictionsVector > 0.5) << " test points predicted to have"
		<< " responses greater than 0.5." << endl;
	ALOG << accu(oPredictionsVector < 0) << " test points predicted to have "
		<< "negative responses." << endl;

	ALOG << "Decision Tree v1" << endl;

	return 0;
}
