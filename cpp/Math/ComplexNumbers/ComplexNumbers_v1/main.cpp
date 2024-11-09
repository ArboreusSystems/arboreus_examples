/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/11/2024 at 21:20:25
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include "Logger/alogger.h"

// Namespace
using namespace std;

// Definitions
typedef complex<double> AComplex;


// Console Application
int main(int inCounter, char* inArguments[]) {

	AComplex oX(10,4);
	ALOG << "oX = " << oX << endl;

	AComplex oZ;
	ALOG << "oZ = " << oZ << endl;
	oZ = AComplex(5,8);
	ALOG << "oZ = " << oZ << endl;

	AComplex oI(0,1);
	ALOG << "oI = " << oI << endl;

	ALOG << "--------------------" << endl;

	ALOG << "oX + oZ = " << oX + oZ << endl;
	ALOG << "oX * oZ = " << oX * oZ << endl;
	ALOG << "oX / oZ = " << oX / oZ << endl;

	ALOG << "--------------------" << endl;

	ALOG << "real(oX) = " << real(oX) << endl;
	ALOG << "imag(oX) = " << imag(oX) << endl;
	ALOG << "abs(oX) = " << abs(oX) << endl;
	ALOG << "arg(oX) = " << arg(oX) << endl;
	ALOG << "norm(oX) = " << norm(oX) << endl;
	ALOG << "conj(oX) = " << conj(oX) << endl;
	ALOG << "polar(2.0,0.1) = " << polar(2.0,0.1) << endl;
	ALOG << "proj(oX) = " << proj(oX) << endl;

	ALOG << "--------------------" << endl;

	ALOG << "cos(oX) = " << cos(oX) << endl;
	ALOG << "cosh(oX) = " << cosh(oX) << endl;
	ALOG << "exp(oX) = " << exp(oX) << endl;
	ALOG << "log(oX) = " << log(oX) << endl;
	ALOG << "log10(oX) = " << log10(oX) << endl;
	ALOG << "pow(oX,2) = " << pow(oX,2) << endl;
	ALOG << "sin(oX) = " << sin(oX) << endl;


	ALOG << "--------------------" << endl;

	ALOG << "ComplexNumbers_v1" << endl;

	return 0;
}
