/* -------------------------------------------------------------------
 *  @doc AR|BO|RE|US C Examples: Digits order counting
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
	int DigitsOrder = 0;
	do {
		DigitsOrder++;
		printf("Number: %lld, DigitsOrder: %d\n",Number,DigitsOrder);
	} while ((Number /= 10) > 0);
	printf("The digits order is %d\n",DigitsOrder);
	return 0;
}