#include <iostream>

using namespace std;

#ifndef ARRAY_SIZE
#define ARRAY_SIZE 1
#endif


// Class prototype
class Array{

	public:
		Array();
		Array(int);
		Array(const Array &);
		float Get_item(int i);
		int Length();
		~Array();

	private:
		void Array_set(float *);
		float *m;
		int n;
};


// Constructor
Array::Array(){

	n = ARRAY_SIZE;
	Array_set(nullptr);
};


// Constructor by size
Array::Array(int n){

	if (n < 1){
		cout << "Error!\n" << endl;
	}
	Array::n = n;
	Array_set(nullptr);
};


// Constructor for copy
Array::Array(const Array &Original){

	Array::n = Original.n;
	Array_set(Original.m);
};


// Destructor
Array::~Array(){

	delete []m;
};


// Set Array
void Array::Array_set(float *m){

	Array::m = new float[n];
	if (m == nullptr){
		for (int i = 0; i < n; i++){
			Array::m[i] = 0;
		}
	} else {
		for (int i = 0; i < n; i++){
			Array::m[i] = m[i];
		}
	}
};


// Get Item of Array
float Array::Get_item(int i){

	if ((0 <= i) && (i <= n)){
		return m[i];
	} else {
		return 0;
	}
};


// Size of Array
int Array::Length(){

	return n;
}


// Application main
int main(){

	Array Array1;
	cout << Array1.Get_item(0) << endl;
	cout << "Hello Array!" << endl;
	return 0;
}
