#include "alibrary3_v4.h"


ALibrary3_v4::ALibrary3_v4(void) {

	pLibrary2 = new ALibrary2_v4();

	cout << "ALibrary3_v4 created" << endl;
}

ALibrary3_v4::~ALibrary3_v4(void) {

	cout << "ALibrary3_v4 deleted" << endl;
}
