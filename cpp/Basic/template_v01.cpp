/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Templates.
 *
 * @end
 * Created : 01/17/2019 at 17:47
*///-----------------------------------------
#include <iostream>

using namespace std;


// Template
template <typename Template>
Template sum(const Template &x, const Template &y){
	return x + y;
};


// Test application
int main()
{

	cout << "Integer: " << sum(1,2) << endl;
	cout << "Double: " << sum(0.5,.5) << endl;
	cout << "Float: " << sum<float>(1,0.5) << endl;
	cout << "String (by parameter): " << sum((string)"Hello",(string)"World") << endl;
	cout << "String (by function): " << sum<string>("Hello","World") << endl;

	cout << "Hello template!" << endl;
	return 0;
}
