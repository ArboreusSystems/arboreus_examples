/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/03/2022 at 13:24:40
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <random>
#include <chrono>

// Application includes

// Namespace
using namespace std;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	std::random_device oRandomDevice;
	std::mt19937::result_type oSeed = oRandomDevice() ^ (
		(std::mt19937::result_type) std::chrono::duration_cast<std::chrono::seconds>(
			std::chrono::system_clock::now().time_since_epoch()
		).count() +
		(std::mt19937::result_type) std::chrono::duration_cast<std::chrono::microseconds>(
			std::chrono::high_resolution_clock::now().time_since_epoch()
		).count()
	);
	std::mt19937 oGenerator(oSeed);
	std::mt19937::result_type oNumber;

	for (int i = 0; i < 20; i++) {
		oNumber = oGenerator();
		std::cout << oNumber << "\n";
	}

	cout << "Random v1" << endl;
	return 0;
}
