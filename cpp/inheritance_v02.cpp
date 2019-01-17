/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Class inheritance. Overload methods.
 *
 * @end
 * Created : 01/17/2019 at 09:01
*///-----------------------------------------

#include <iostream>

using namespace std;


// Parent Class
class Parent{
	public:
		void Set_x(int x){
			Parent::x = x;
		}
		int Get_x(void){
			return x;
		}
	private:
		int x;
};


// Child Class
class Child : public Parent {
	public:
		void Set_x(int x){
			Child::x = x;
		}
		int Get_x(void){
			return x;
		}
	private:
		int x;
};


// Test application
int main(){

	Child Child;
	Child.Set_x(1);
	Child.Set_x(2);

	cout << "Child.X: " << Child.Get_x() << endl;
	cout << "Child.Y: " << Child.Get_x() << endl;

	Child.Parent::Set_x(1);
	Child.Set_x(2);

	cout << "Child.X: " << Child.Parent::Get_x() << endl;
	cout << "Child.Y: " << Child.Get_x() << endl;

	cout << "Hello Inheritance!" << endl;
	return 0;
}
