/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 21/07/2020 at 12:25:49
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Namespace
using namespace std;

// Application includes
#include "alogger.h"
#include "aobject.h"

// Constants


// Application
int main(int inCounter, char *inArguments[]) {

	AObject* oObject1 = new AObject("oObject1");
	oObject1->mTestMethod();

	{
		unique_ptr<AObject> oObject2(new AObject("oObject2"));
		oObject2->mTestMethod();
	}

	{
		unique_ptr<AObject> oObject3 =  make_unique<AObject>("oObject3");
		oObject1->mTestMethod();
	}

	{
		shared_ptr<AObject> oSharedObject;
		{
			shared_ptr<AObject> oObject4 = make_shared<AObject>("oObject4");
			oSharedObject = oObject4;
		}
		oSharedObject->mTestMethod();
	}

	delete oObject1;

	ALOG << "Smart pointers demo - OK" << endl;


	return 0;
}
