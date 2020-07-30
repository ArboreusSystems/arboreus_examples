/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/07/2020 at 17:57:09
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <vector>

// Application includes
#include "alogger.h"
#include "aobject.h"
#include "aobject0.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"

// Constants

// Namespace
using namespace std;

// Application
int main(int inCounter, char *inArguments[]) {

	vector<AObject*>* oVector = new vector<AObject*>();
	oVector->push_back(static_cast<AObject*>(new AObject0()));
	oVector->push_back(static_cast<AObject*>(new AObject0()));
	oVector->push_back(static_cast<AObject*>(new AObject1()));
	oVector->push_back(static_cast<AObject*>(new AObject2()));
	oVector->push_back(static_cast<AObject*>(new AObject2()));
	oVector->push_back(static_cast<AObject*>(new AObject3()));
	oVector->push_back(static_cast<AObject*>(new AObject2()));
	oVector->push_back(static_cast<AObject*>(new AObject3()));

	ALOG << "oVector size:" << oVector->size() << endl;

//	for (AObject* inObject : *oVector) {
//		ALOG << "Object type: " << inObject->mGetType() << endl;
//	}

	for (AObject* inObject : *oVector) {
		switch (inObject->mGetType()) {
			case AObjectType::Zero:
				static_cast<AObject0*>(inObject)->mTestMethod0();
				break;
			case AObjectType::One:
				static_cast<AObject1*>(inObject)->mTestMethod1();
				break;
			case AObjectType::Two:
				static_cast<AObject2*>(inObject)->mTestMethod2();
				break;
			case AObjectType::Three:
				static_cast<AObject3*>(inObject)->mTestMethod3();
				break;
			default:
				ALOG << "Wrong object type" << endl;
				break;
		}
	}

	ALOG << "Return multiple values demo - OK" << endl;
	return 0;
}
