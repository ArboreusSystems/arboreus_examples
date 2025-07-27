#include <iostream>
#include <limits>

using namespace std;

typedef numeric_limits<char> AChar;
typedef numeric_limits<int> AInt;


int main(int inCount, char* inArguments[]) {

	cout << "bytes of char = " << sizeof(char) << endl;
	cout << "char lowest = " << +AChar::lowest() << endl;
	cout << "char min = " << +AChar::min() << endl;
	cout << "char max = " << +AChar::max() << endl;

	cout << "bytes of int = " << sizeof( int ) << endl;
	cout << "int lowest = " << AInt::lowest() << endl;
	cout << "int min = " << AInt::min() << endl;
	cout << "int max = " << AInt::max() << endl;


	return 0;
}
