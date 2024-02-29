#include <stdio.h>
#include <time.h>

int main() {

	printf("Timestamp_v3\n");

	time_t clk = time(NULL);
	printf("%s", ctime(&clk));
	return 0;
}
