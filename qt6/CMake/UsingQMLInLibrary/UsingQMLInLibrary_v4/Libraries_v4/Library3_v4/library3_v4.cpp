#include "library3_v4.h"


Library3_v4::Library3_v4(void) {

	pLibrary2 = new Library2_v4();

	cout << "Created Library3_v4" << endl;
}

Library3_v4::~Library3_v4(void) {

	cout << "Deleted Library3_v4" << endl;
}
