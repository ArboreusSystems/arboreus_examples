#include <iostream>
#include <array>
#include <tuple>
#include <string>

using namespace std;


int main() {

	cout << "C++ Arrays demo" << endl;
	array<string,5> oArrayOfString = {
		"String 1",
		"String 2",
		"String 3",
		"String 4",
		"String 5"
	};

	cout << "\nExample of iterating array:" << endl;
	cout << "For loop v1 iterating" << endl;
	for (string* i = oArrayOfString.begin(); i != oArrayOfString.end(); ++i) {
		cout << *i << endl;
	}
	cout << "For loop v2 iterating" << endl;
	for (auto &iElement: oArrayOfString) {
		cout << iElement << endl;
	}
	cout << "While loop iterating" << endl;
	auto oIterator = oArrayOfString.begin();
	while (oIterator != oArrayOfString.end()) {
		cout << *oIterator << endl;
		oIterator++;
	}
	cout << "Foreach loop iterating" << endl;
	for_each(
		oArrayOfString.begin(),
		oArrayOfString.end(),
		[](const string& iElement) {
			cout << iElement << endl;
		}
	);

	cout << "\nArray properties:" << endl;
	cout << "Size: " << oArrayOfString.size() << endl;
	cout << "Max size: " << oArrayOfString.max_size() << endl;
	cout << "Empty: " << oArrayOfString.empty() << endl;

	cout << "\nReversed array:" << endl;
	reverse_copy(
		oArrayOfString.begin(),
		oArrayOfString.end(),
		ostream_iterator<string>(cout,"\n")
	);

	cout << "\nArray empty demo:" << endl;
	array<int,0> oArrayEmpty1;
	array<int,5> oArrayEmpty2;
	cout << "1: " << (oArrayEmpty1.empty() ? "empty" : "not empty") << endl;
	cout << "2: " << (oArrayEmpty2.empty() ? "empty" : "not empty") << endl;

	return 0;
}
