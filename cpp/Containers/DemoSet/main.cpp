#include <iostream>

#include <set>

#include "aglobal.h"
#include "aset.h"

using namespace std;

struct APair {

	string Key;
	string Value;

	APair operator()(APair &inPair1,APair &inPair2) {

		if (inPair1.Key >= inPair2.Key) {
			return inPair1;
		}
		return inPair2;
	}
};

int main() {

	ALOG << "Demo std::set" << endl;

	APair oElement;
	set<APair>* oSet = new set<APair>();

	oElement.Key = "one_key";
	oElement.Value = "one_vaue";
	oSet->insert(oElement);


	return 0;
}
