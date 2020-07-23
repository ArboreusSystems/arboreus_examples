/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/07/2020 at 10:41:34
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <vector>

// Application includes
#include "maindatamodels.h"
#include "alogger.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"

// Constants and definitions

// Namespace
using namespace std;


// Application
int main(int inCounter, char *inArguments[]) {

	AUnion oUnion1 = AUnion();
	oUnion1.pOne = new AObject1();
	AUnionValue oValue1 = AUnionValue(AUnionType::One,oUnion1);

	AUnion oUnion2 = AUnion();
	oUnion2.pTwo = new AObject2();
	AUnionValue oValue2 = AUnionValue(AUnionType::Two,oUnion2);

	AUnion oUnion3 = AUnion();
	oUnion3.pThree = new AObject3();
	AUnionValue oValue3 = AUnionValue(AUnionType::Three,oUnion3);

	vector<AUnionValue> oVector = {oValue1,oValue2,oValue3};
	for_each(
		oVector.begin(),
		oVector.end(),
		[](AUnionValue inValue){
			AUnion oData = inValue.pData;
			switch (inValue.pType) {
				case AUnionType::One:
					ALOG << "Type 1: " << (string)oData.pOne->pString << endl;
					break;
				case AUnionType::Two:
					ALOG << "Type 2: " << (int)oData.pTwo->pInteger1 << endl;
					ALOG << "Type 2: " << (int)oData.pTwo->pInteger2 << endl;
					ALOG << "Type 2: " << (int)oData.pTwo->pInteger3 << endl;
				case AUnionType::Three:
					ALOG << "Type 3: " << (float)oData.pThree->pFloat1 << endl;
					ALOG << "Type 3: " << (float)oData.pThree->pFloat2 << endl;
					ALOG << "Type 3: " << (float)oData.pThree->pFloat3 << endl;
				default:
					break;
			}
		}
	);

	ALOG << "Union demo - OK!" << endl;
	return 0;
}
