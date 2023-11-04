#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/utsname.h>
#include <netdb.h>


int main() {

	size_t oHostNameLength = 128;
	char* oHostname = 0;

	while (1) {

		char* iReallocatedHostname = realloc(oHostname,oHostNameLength);
		if (iReallocatedHostname == 0) {
			free(oHostname);
			printf("Finished with error. Can't reallocate memory.");
			return 1;
		}

		oHostname = iReallocatedHostname;
		oHostname[oHostNameLength - 1] = 0;
		if (gethostname(oHostname,oHostNameLength - 1) == 0) {
			size_t iCount = strlen(oHostname);
			if (iCount < oHostNameLength - 2) break;
		}

		oHostNameLength  *= 2;
	}

	printf("Hostname: %s\n",oHostname );
	free(oHostname);

	return 0;
}
