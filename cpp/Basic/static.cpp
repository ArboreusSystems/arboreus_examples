/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Handling Static methods and instances
 *
 * @end
 * Created : 01/14/2019 at 09:01
*///-----------------------------------------

// Includes
#include <iostream>
#include "string.h"

// Namespaces
using namespace std;


// -----------------------------------------
// Class prototype

class Spices{

	public:
		Spices(
			char *Spice,
			char *Origin,
			char *Measure,
			int Weight,
			float Price
		);
		void Output(void);
		static void Set_rate (float Rate);

	private:
		char Spice[32];
		char Origin[32];
		char Measure[8];
		int Weight;
		float Price;
		static float Rate;
};


// -----------------------------------------
// Static instances

float Spices::Rate;


// -----------------------------------------
// Constractors

Spices::Spices(char *S,char *O,char *M,int W,float P){

	strcpy(Spice,S);
	strcpy(Origin,O);
	strcpy(Measure,M);
	Weight = W;
	Price = P;
	Set_rate(Rate);
};


// -----------------------------------------
// Methods

void Spices::Output(){

	cout << "Spice: " <<  Spice << " ";
	cout << "Origin: " << Origin << " ";
	cout << "Weight: " << Weight << Measure << " ";
	cout << "Price: " << Price * Rate * Weight << endl;
};

void Spices::Set_rate(float Rate){

	Spices::Rate = Rate;
};


// -----------------------------------------
// Aplication

int main(){


	char s1[] = "Anise"; char o1[] = "Spain"; char m1[] = "g";
	Spices Spice1(s1,o1,m1,345,5.99);
	char s2[] = "Garlic"; char o2[] = "Russia"; char m2[] = "g";
	Spices Spice2(s2,o2,m2,128,0.99);
	char s3[] = "Chili Garlic"; char o3[] = "Argentina"; char m3[] = "g";
	Spices Spice3(s3,o3,m3,16,8.59);

	Spices::Set_rate(1.4);

	cout << "List of spices." << endl;
	Spice1.Output();
	Spice2.Output();
	Spice3.Output();

	return 0;
}
