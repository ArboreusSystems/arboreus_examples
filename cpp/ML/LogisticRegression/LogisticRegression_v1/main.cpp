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
#include "ML/alogisticregression.h"

// Namespace
using namespace std;
using namespace Eigen;

// Console Application
int main(int inCounter, char* inArguments[]) {

	AETL* oETL = new AETL("../../Data/data.csv",";",false);
	vector<vector<string>> oData = oETL->mReadCSV();

	int oRows = oData.size();
	int oColumns = oData[0].size();
	MatrixXd oMatrix = oETL->mCSVToMatrix(oData,oRows,oColumns);
	MatrixXd oNormilzedMatrix = oETL->mNormalize(oMatrix,false);

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

	ALogisticRegression* oLogisticRegression = new ALogisticRegression();

	int oDims = oTrainX.cols();
	MatrixXd oWeight = VectorXd::Zero(oDims);
	double oBias = 0.0;
	double oLambda = 0.0;
	bool oLogCost = true;
	double oLearningRate = 0.01;
	int oIterations = 2000;

	MatrixXd oDW; double oDB; list<double> oCosts;
	tie(oWeight,oBias,oDW,oDB,oCosts) = oLogisticRegression->mOptimize(
		oWeight,oBias,oTrainX,oTrainY,oIterations,oLearningRate,oLambda,oLogCost
	);

	MatrixXd oYPredictionTrain = oLogisticRegression->mPredict(oWeight,oBias,oTrainX);
	auto oTrainAccuracy = (100 - (oYPredictionTrain - oTrainY).cwiseAbs().mean() * 100);
	ALOG << "oTrainAccuracy = " << oTrainAccuracy << endl;

	MatrixXd oYPredictionTest = oLogisticRegression->mPredict(oWeight,oBias,oTestX);
	auto oTestAccuracy = (100 - (oYPredictionTest - oTestY).cwiseAbs().mean() * 100);
	ALOG << "oTestAccuracy = " << oTestAccuracy << endl;

	ALOG << "LogisticRegression_v1" << endl;

	return 0;
}
