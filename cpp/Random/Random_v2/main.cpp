/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/03/2022 at 13:38:24
 * */// --------------------------------------------------------------

// System includes
#include <iostream>
#include <algorithm>
#include <chrono>
#include <random>

// Application includes

// Namespace
using namespace std;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;


int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	std::random_device oRandomDevice;
	mt19937_64 oNumber;
	std::mt19937_64::result_type oSeed;
	std::mt19937_64::result_type oValue1;
	std::mt19937_64::result_type oValue2;
	std::mt19937_64::result_type oValue3;
	int oSeedFragments = 64;

	for (int i = 0; i < 20; i++) {

		oValue1 = (std::mt19937_64::result_type) std::chrono::duration_cast<std::chrono::seconds>(
			std::chrono::system_clock::now().time_since_epoch()
		).count();
		oValue2 = (std::mt19937_64::result_type) std::chrono::duration_cast<std::chrono::microseconds>(
			std::chrono::system_clock::now().time_since_epoch()
		).count();
		oValue3 = (oValue2 % 10000000) * 1000;
		oSeed = oRandomDevice() ^ ((oValue1 + oValue2 + oValue3) / (1 + arc4random() % (1 + arc4random() % oSeedFragments)));
		oNumber.seed(oSeed);

		cout << "oNumber: " << oNumber << "\n";
		cout << "oValue1: " << oValue1 << " oValue2: " << oValue2 << " oValue3: " << oValue3 << " oSeed: " << oSeed << "\n";
		cout << "oNumber.default_seed: " << oNumber.default_seed << "\n";
		cout << "oNumber.initialization_multiplier: " << oNumber.initialization_multiplier << "\n";
		cout << "oNumber.mask_bits: " << oNumber.mask_bits << "\n";
		cout << "oNumber.max(): " << oNumber.max() << "\n";
		cout << "oNumber.min(): " << oNumber.min() << "\n";
		cout << "oNumber.shift_size: " << oNumber.shift_size << "\n";
		cout << "oNumber.state_size: " << oNumber.state_size << "\n";
		cout << "oNumber.tempering_b: " << oNumber.tempering_b << "\n";
		cout << "oNumber.tempering_c: " << oNumber.tempering_c << "\n";
		cout << "oNumber.tempering_d: " << oNumber.tempering_d << "\n";
		cout << "oNumber.tempering_l: " << oNumber.tempering_l << "\n";
		cout << "oNumber.tempering_s: " << oNumber.tempering_s << "\n";
		cout << "oNumber.tempering_t: " << oNumber.tempering_t << "\n";
		cout << "oNumber.tempering_u: " << oNumber.tempering_u << "\n";
		cout << "oNumber.word_size: " << oNumber.word_size << "\n";
		cout << "oNumber.xor_mask: " << oNumber.xor_mask << "\n";
		cout << "oNumber._Max: " << oNumber._Max << "\n";
		cout << "oNumber._Min: " << oNumber._Min << "\n";
	}

	cout << "Random v2" << endl;
	return 0;
}
