/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/10/2020 at 06:11:58
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Application includes

// Namespace
using namespace std;


class ObjectB;

class ObjectA {

	public:

		ObjectB* pObjectB = nullptr;

		ObjectA(void) {}
		~ObjectA(void) {}
};

class ObjectB {

	public:

		ObjectB(void) {}
		~ObjectB(void) {}

		string mTestString(void) {

			return pTestString;
		}

	private:

		string pTestString = "ObjectB Test String";
};


int main(int inCounter, char *inArguments[]) {

	cout << "Forward declaration example" << endl;

	ObjectA* oObjectA = new ObjectA();
	ObjectB* oObjectB = new ObjectB();
	oObjectA->pObjectB = oObjectB;

	cout << "Call string from oObjectA: " << oObjectA->pObjectB->mTestString() << endl;

	return 0;
}
