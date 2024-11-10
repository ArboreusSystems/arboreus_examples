// ----------------------------------------------------------
/*!
	\class AObjectOne
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2024 at 08:24:13
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aetl.h"


// -----------
/*!
	\fn

	Doc.
*/

AETL::AETL(string inData, string inSeparator, bool inHead) {

	pDataset = inData;
	pDelimiter = inSeparator;
	pHeader = inHead;

	ALOG << "AETL created" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/

AETL::~AETL(void) {

	ALOG << "AETL deleted" << endl;
}


// -----------
/*!
	\fn

	Doc.
*/


vector<vector<string>> AETL::mReadCSV(void) {

	ifstream oFile(pDataset);
	vector<vector<string>> oDataString;

	string oLine = "";
	while (getline(oFile,oLine)) {
		vector<string> oVecotor;
		boost::algorithm::split(oVecotor,oLine,boost::is_any_of(pDelimiter));
		oDataString.push_back(oVecotor);
	}

	oFile.close();

	return oDataString;
}


// -----------
/*!
	\fn

	Doc.
*/

MatrixXd AETL::mCSVToMatrix(vector<vector<string> > inData, int inRows, int inColumns) {

	int oRows = inRows;
	int oColumns = inColumns;

	if (pHeader) {
		oRows = oRows - 1;
	}

	MatrixXd oMatrix(oColumns,oRows);
	for (int i = 0; i < oRows; i++) {
		for (int j = 0; j < oColumns; j++) {
			oMatrix(j,i) = atof(inData[i][j].c_str());
		}
	}

	return oMatrix.transpose();
}


// -----------
/*!
	\fn

	Doc.
*/

MatrixXd AETL::mNormalize(MatrixXd inMatrix,bool inTarget) {

	MatrixXd oMatrixIncome;
	if (inTarget) {
		oMatrixIncome = inMatrix;
	} else {
		oMatrixIncome = inMatrix.leftCols(inMatrix.cols() - 1);
	}

	auto oMean = mMean(oMatrixIncome);
	MatrixXd oScaledMatrix = oMatrixIncome.rowwise() - oMean;
	auto oStd = mStd(oScaledMatrix);
	MatrixXd oNormalizedMatrix = oScaledMatrix.array().rowwise() / oStd;

	if (!inTarget) {
		oNormalizedMatrix.conservativeResize(oNormalizedMatrix.rows(),oNormalizedMatrix.cols() + 1);
		oNormalizedMatrix.col(oNormalizedMatrix.cols() - 1) = inMatrix.rightCols(1);
	}

	return oNormalizedMatrix;
}


// -----------
/*!
	\fn

	Doc.
*/

tuple<MatrixXd,MatrixXd,MatrixXd,MatrixXd> AETL::mTrainAndTest(MatrixXd inMatrix, float inSize) {

	int oRows = inMatrix.rows();
	int oTrainRows = round(inSize * oRows);
	int oTestRows = oRows - oTrainRows;

	MatrixXd oTrain = inMatrix.topRows(oTrainRows);
	MatrixXd oTrainX = oTrain.leftCols(inMatrix.cols() - 1);
	MatrixXd oTrainY = oTrain.rightCols(1);

	MatrixXd oTest = inMatrix.bottomRows(oTestRows);
	MatrixXd oTestX = oTest.leftCols(inMatrix.cols() - 1);
	MatrixXd oTestY = oTest.rightCols(1);

	tuple oOutput = make_tuple(oTrainX,oTrainY,oTestX,oTestY);

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

auto AETL::mMean(MatrixXd inMatrix)
	-> decltype(inMatrix.colwise().mean()) {

	return inMatrix.colwise().mean();
}


// -----------
/*!
	\fn

	Doc.
*/

auto AETL::mStd(MatrixXd inMatrix)
	-> decltype(((inMatrix.array().square().colwise().sum())/(inMatrix.rows() - 1)).sqrt()) {

	return ((inMatrix.array().square().colwise().sum())/(inMatrix.rows() - 1)).sqrt();
}

