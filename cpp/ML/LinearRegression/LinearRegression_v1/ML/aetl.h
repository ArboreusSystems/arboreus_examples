// ----------------------------------------------------------
/*!
	\headerfile AObjectOne
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2024 at 08:24:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef AETL_H
#define AETL_H

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include "../Logger/alogger.h"

// Constants and definitions

// Namespace
using namespace std;
using namespace Eigen;

// Class definitions
class AETL {

	public:

		explicit AETL(string inPath, string inSeparator, bool inHead);
		virtual ~AETL(void);

		vector<vector<string>> mReadCSV(void);
		MatrixXd mCSVToMatrix(vector<vector<string>> inData,int inRows, int inColumns);
		MatrixXd mNormalize(MatrixXd inMatrix);
		tuple<MatrixXd,MatrixXd,MatrixXd,MatrixXd> mTrainAndTest(MatrixXd inMatrix, float inSize);

	private:

		string pDataset;
		string pDelimiter;
		bool pHeader;

		auto mMean(MatrixXd inMatrix) ->
			decltype(inMatrix.colwise().mean());
		auto mStd(MatrixXd inMatrix) ->
			decltype(((inMatrix.array().square().colwise().sum())/(inMatrix.rows() - 1)).sqrt());
};

#endif // AETL_H
