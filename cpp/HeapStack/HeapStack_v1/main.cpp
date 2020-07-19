/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 19/07/2020 at 13:12:12
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes
#include "maindatamodels.h"
#include "alogger.h"

// Constants
#define A_MAX_LOOP_COUNT 10000000

// Namespace
using namespace std;


// Application
int main(int inCounter, char *inArguments[]) {

	int oStackInteger = 10;

	int oStackArray[10];
	oStackArray[0] = 0; oStackArray[1] = 1;
	oStackArray[2] = 2; oStackArray[3] = 3;
	oStackArray[4] = 4; oStackArray[5] = 5;
	oStackArray[6] = 6; oStackArray[7] = 7;
	oStackArray[8] = 8; oStackArray[9] = 9;

	ACordinates oStackCordinates;
	oStackCordinates.pX = 100;
	oStackCordinates.pY = 100;

	int* oHeapInteger = new int; *oHeapInteger =  5;

	int* oHeapArray = new int[10];
	oHeapArray[0] = 0; oHeapArray[1] = 1;
	oHeapArray[2] = 2; oHeapArray[3] = 3;
	oHeapArray[4] = 4; oHeapArray[5] = 5;
	oHeapArray[6] = 6; oHeapArray[7] = 7;
	oHeapArray[8] = 8; oHeapArray[9] = 9;

	ACordinates* oHeapCordinates = new ACordinates();
	oHeapCordinates->pX = 20;
	oHeapCordinates->pY = 20;

	delete oHeapInteger;
	delete[] oHeapArray;
	delete oHeapCordinates;

	clock_t oStackAllocStart = clock();
	for (int i = 0; i < A_MAX_LOOP_COUNT; ++i) {
		ACordinates iStackCordinates1 = ACordinates();
	}
	clock_t oStackAllocDuartion = clock() - oStackAllocStart;
	ALOG << "Stack allocation duration: " << oStackAllocDuartion << endl;

	clock_t oHeapAllocStart = clock();
	for (int i = 0; i < A_MAX_LOOP_COUNT; ++i) {
		ACordinates* iHeapCordinates1 = new ACordinates();
//		delete iHeapCordinates1;
	}
	clock_t oHeapAllocDuartion = clock() - oHeapAllocStart;
	ALOG << "Heap allocation duration: " << oHeapAllocDuartion << endl;

	ALOG << "Heap and stack demo OK" << endl;

	return 0;
}
