/* -------------------------------------------------------------------
 *  @doc AR|BO|RE|US C Examples: Counting the sum of number digits
 *  @notice
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/19/2019 at 19:45
 * */// --------------------------------------------------------------

// System includes
#include <stdio.h>


// Application
int main(int Counter, char *Arguments[]) {
	
	long long int Number = 123456789;
	int Summ = 0;
	do {
		Summ += (Number % 10);
		printf("Summ: %d, Number: %lld\n",Summ,Number);
	} while ((Number /= 10) > 0);
	printf("The digits summ is %d\n",Summ);
	return 0;
}