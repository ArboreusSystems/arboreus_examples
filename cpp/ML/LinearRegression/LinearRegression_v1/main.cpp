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
#include "ML/aetl.h"
#include "ML/alinearregression.h"

// Namespace
using namespace std;


// Console Application
int main(int inCounter, char* inArguments[]) {

	AETL* oETL = new AETL("../../Data/data.csv",";",false);
	vector<vector<string>> oData = oETL->mReadCSV();

	int oRows = oData.size();
	int oColumns = oData[0].size();
	Eigen::MatrixXd oMatrix = oETL->mCSVToMatrix(oData,oRows,oColumns);
	Eigen::MatrixXd oNormilzedMatrix = oETL->mNormalize(oMatrix);

	MatrixXd oTrainX,oTrainY,oTestX,oTestY;
	tie(oTrainX,oTrainY,oTestX,oTestY) = oETL->mTrainAndTest(oNormilzedMatrix,0.8);

	ALOG << "oTrainX.rows(): " << oTrainX.rows() << endl;
	ALOG << "oTrainX.cols(): " << oTrainX.cols() << endl;
	ALOG << "oTrainY.rows(): " << oTrainY.rows() << endl;
	ALOG << "oTrainY.cols(): " << oTrainY.cols() << endl;

	ALOG << "oTestX.rows(): " << oTestX.rows() << endl;
	ALOG << "oTestX.cols(): " << oTestX.cols() << endl;
	ALOG << "oTestY.rows(): " << oTestY.rows() << endl;
	ALOG << "oTestY.cols(): " << oTestY.cols() << endl;

	ALinearRegression* oLinearRegression = new ALinearRegression();

	VectorXd oVectorTrain = VectorXd::Ones(oTrainX.rows());
	oTrainX.conservativeResize(oTrainX.rows(),oTrainX.cols() + 1);
	oTrainX.col(oTrainX.cols() - 1) = oVectorTrain;

	VectorXd oVectorTest = VectorXd::Ones(oTestX.rows());
	oTestX.conservativeResize(oTestX.rows(),oTestX.cols() + 1);
	oTestX.col(oTrainX.cols() - 1) = oVectorTest;

	VectorXd oTheta = VectorXd::Zero(oTrainX.cols());
	float oAlpha = 0.01;
	int oIterations = 1000;

	VectorXd oThetaOut;
	vector<float> oCost;

	tie(oThetaOut,oCost) = oLinearRegression->mGradientDescent(
		oTrainX,oTrainY,oTheta,oAlpha,oIterations
	);

	ALOG << "oThetaOut: \n" << oThetaOut << endl;

	ALOG << "oCost:" << endl;
	for (auto iCost : oCost) {
		ALOG << iCost << endl;
	}

	ALOG << "Linear Regression v1" << endl;

	return 0;
}
