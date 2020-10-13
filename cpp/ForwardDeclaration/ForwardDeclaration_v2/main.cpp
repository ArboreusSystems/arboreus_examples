/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/10/2020 at 06:30:59
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes
#include "alogger.h"
#include "aobjecta.h"
#include "aobjectb.h"

// Namespace
using namespace std;


// Application
int main(int inCounter, char *inArguments[]) {

	ALOG << "Forward declaration v2" << endl;

	AObjectA* oObjectA = new AObjectA();
	AObjectB* oObjectB = new AObjectB();
	oObjectA->pObjectB = oObjectB;
	oObjectB->pObjectA = oObjectA;

	ALOG << "oObjectA: " << oObjectA->pObjectB->mTestString() << endl;
	ALOG << "oObjectB: " << oObjectB->pObjectA->mTestString() << endl;

	return 0;
}
