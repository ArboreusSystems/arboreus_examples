/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Polymorphism.
 *
 * @end
 * Created : 01/17/2019 at 11:27
*///-----------------------------------------

#include <iostream>

using namespace std;


// Class A
class A{
	public:
		void General(void){
			cout << "A::General" << endl;
		}
		virtual void Polymorphic(void){
			cout << "A::Polymorphic" << endl;
		}
		virtual ~A();
};


// Class B
class B : public A{
	public:
		void General(void){
			cout << "B::General" << endl;
		}
		virtual void Polymorphic(void){
			cout << "B::Polymorphic" << endl;
		}
		virtual ~B();
};


// Test application
int main(){

	B *b = new B();
	A *a = b;

	a->General();
	a->Polymorphic();

	b->General();
	b->Polymorphic();

	cout << "Hello polymorphism!" << endl;
	return 0;
}
