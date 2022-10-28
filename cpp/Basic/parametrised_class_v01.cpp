/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Parametised class.
 *
 * @end
 * Created : 01/17/2019 at 18:15
*///-----------------------------------------

#include <iostream>

using namespace std;


// Define parametrised class
template <typename Template>
class Paramitrised{
	public:
		Paramitrised(Template);
		Template Get_x(void);
	private:
		Template x;
};

template <typename Template>
Paramitrised<Template>::Paramitrised(Template x){
	Paramitrised::x = x;
}

template <typename Template>
Template Paramitrised<Template>::Get_x(void){
	return x;
}


// Test application
int main()
{

	Paramitrised <int>Test_parametrised(10);
	cout << Test_parametrised.Get_x() << endl;

	cout << "Hello Parametrised Class!" << endl;
	return 0;
}
