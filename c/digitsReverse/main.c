/* -------------------------------------------------------------------
 *  @doc AR|BO|RE|US C Examples: Digits reverse
 *  @notice
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/19/2019 at 19:37
 * */// --------------------------------------------------------------

// System includes
#include <stdio.h>


// Application
int main(int Counter, char *Arguments[]) {
	
	long long int Number = 123456789;
	long long int Reverse = 0;
	do {
		Reverse = Reverse * 10 + (Number % 10);
		printf("Number: %lld, DigitsOrder: %lld\n",Number,Reverse);
	} while ((Number /= 10) > 0);
	printf("The digits reverse is %lld\n",Reverse);
	return 0;
}