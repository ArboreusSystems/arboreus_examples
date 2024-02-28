#include <stdio.h>
#include <time.h>
#include <stdint.h>
#include <inttypes.h>

int main(void) {

	struct timespec oTimeSpecification;

	// The POSIX.1-2008 way of getting UNIX Timestamp microseconds
	if (clock_gettime(CLOCK_REALTIME,&oTimeSpecification)) {
		return -1;
	}

	int64_t oMicroseconds = oTimeSpecification.tv_sec * 1000000;
	oMicroseconds += oTimeSpecification.tv_nsec/1000;
	if (oTimeSpecification.tv_nsec % 1000 >= 500) {
		++oMicroseconds;
	}

	printf("%"PRId64"\n",oMicroseconds);

	return 0;
}
