#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <thread>

#include "aglobal.h"
#include "afile.h"
#include "arandombook.h"
#include "arandom.h"
#include "astatictable.h"


using namespace std;

int main() {

	ALOG << "Arboreus Crytograhy Example" << endl;
	ALOG << "Table Expansion" << endl;

	ALOG << "----" << endl;
	ALOG << "UTF interpretation of Ceaser cipher" << endl;
	ALOG << "Encrypted string: " << AStaticTable::mEncrypt(A_DEMO_TEXT) << endl;
	ALOG << "Decrypted string: " << AStaticTable::mDecrypt(AStaticTable::mEncrypt(A_DEMO_TEXT)) << endl;

	ARandomBook* oRandomBook = new ARandomBook();
	ALOG << "----" << endl;
	ALOG << "Random cipher book" << endl;

	return 0;
}
