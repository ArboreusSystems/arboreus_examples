#include <stdio.h>
#include <time.h>

int main() {

	printf("Timestamp_v4\n");

	time_t oSeconds1;
	oSeconds1 = time(NULL);
	printf("Seconds1: %ld\n", oSeconds1);

	struct timespec oTimeSpecification;
	if (clock_gettime(CLOCK_REALTIME,&oTimeSpecification)) {
		return -1;
	}
	printf("Seconds2: %ld\n",oTimeSpecification.tv_sec);

	return 0;
}
