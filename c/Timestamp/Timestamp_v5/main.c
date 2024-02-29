#include <stdio.h>
#include <time.h>

int main() {

	printf("Timestamp_v5\n");

	struct timespec oTimeSpecification;
	if (clock_gettime(CLOCK_REALTIME,&oTimeSpecification)) {
		return -1;
	}

	printf("oTimeSpecification.tv_sec: %ld\n",oTimeSpecification.tv_sec);
	printf("oTimeSpecification.tv_nsec: %ld\n",oTimeSpecification.tv_nsec);

	long long int oSeconds =
		oTimeSpecification.tv_sec;
	printf("Seconds: %lld\n",oSeconds);

	long long int oMilliSeconds =
		oTimeSpecification.tv_sec * 1000 +
		oTimeSpecification.tv_nsec / 1000000;
	printf("Milliseconds: %lld\n",oMilliSeconds);

	long long int oMicroseconds =
		oTimeSpecification.tv_sec * 1000000 +
		oTimeSpecification.tv_nsec / 1000;
	printf("Microseconds: %lld\n",oMicroseconds);

	long long int oNanoSeconds =
		oTimeSpecification.tv_sec * 1000000000 +
		oTimeSpecification.tv_nsec;
	printf("Nanoseconds: %lld\n",oNanoSeconds);

	return 0;
}
