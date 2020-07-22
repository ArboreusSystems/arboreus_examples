/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/07/2020 at 10:41:14
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <algorithm>


// Application includes
#include "alogger.h"
#include "avalues.h"

// Constants

// Namespace
using namespace std;


// Application
int main(int inCounter, char *inArguments[]) {

	AValues* oValues = new AValues();

	pair<string,int> oPair = oValues->mReturnPair();
	ALOG << "oPair.first: " << oPair.first << " [" << typeid(oPair.first).name() << "]" << endl;
	ALOG << "oPair.second: " << oPair.second << " [" << typeid(oPair.second).name() << "]" << endl;

	tuple<int,int,string,float,string,double> oTuple = oValues->mReturnTuple();
	ALOG << "get<0>(oTuple): " << get<0>(oTuple) << " [" << typeid(get<0>(oTuple)).name() << "]" << endl;
	ALOG << "get<1>(oTuple): " << get<1>(oTuple) << " [" << typeid(get<1>(oTuple)).name() << "]" << endl;
	ALOG << "get<2>(oTuple): " << get<2>(oTuple) << " [" << typeid(get<2>(oTuple)).name() << "]" << endl;
	ALOG << "get<3>(oTuple): " << get<3>(oTuple) << " [" << typeid(get<3>(oTuple)).name() << "]" << endl;
	ALOG << "get<4>(oTuple): " << get<4>(oTuple) << " [" << typeid(get<4>(oTuple)).name() << "]" << endl;
	ALOG << "get<5>(oTuple): " << get<5>(oTuple) << " [" << typeid(get<5>(oTuple)).name() << "]" << endl;

	unordered_map<string,int> oMap = oValues->mReturnUnorderedMap();
	for_each(
		oMap.begin(),
		oMap.end(),
		[](pair<string,int> inElement){
			ALOG << "oMap values: " << inElement.first << " -> " << inElement.second << endl;
		}
	);

	ALOG << "Return multiple values demo - OK" << endl;
	return 0;
}
