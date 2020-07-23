/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/07/2020 at 14:07:29
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes
#include "maindatamodels.h"
#include "alogger.h"

// Constants

// Namespace
using namespace std;


// Application
int main(int inCounter, char *inArguments[]) {

	int oInteger1 = 50;

	double oDouble1 = oInteger1;
	double oDouble2 = (double)oInteger1;
	double oDouble3 = *(double*)&oInteger1;
	ALOG << "oInteger1: " << oInteger1 << endl;
	ALOG << "oDouble1: " << oDouble1 << endl;
	ALOG << "oDouble2: " << oDouble2 << endl;
	ALOG << "oDouble3: " << oDouble3 << endl;

	ACordinates oCordinatesObject = {1,2};

	int* oCordinateArray1 = (int*)&oCordinatesObject;
	ALOG << "oCordinatesObject: x -> " << oCordinatesObject.pX << " y -> " << oCordinatesObject.pY << endl;
	ALOG << "oCordinateArray1: x -> " << oCordinateArray1[0] << " y -> " << oCordinateArray1[1] << endl;

	int oX = *(int*)((char*)&oCordinatesObject);
	int oY = *(int*)((char*)&oCordinatesObject + 4);
	ALOG << "oX -> " << oX << " oY -> " << oY << endl;

	int* oCordinatesArray2 = oCordinatesObject.mGetArray();
	ALOG << "oCordinateArray2: x -> " << oCordinatesArray2[0] << " y -> " << oCordinatesArray2[1] << endl;

	ALOG << "Type punnning in C++ demo - OK" << endl;
	return 0;
}
