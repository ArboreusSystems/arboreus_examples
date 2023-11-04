#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/utsname.h>
#include <netdb.h>


int main() {

	size_t oHostNameLength = 128;
	char* oHostName = 0;

	while (1) {

		char* oReallocatedHostname = realloc(oHostName,oHostNameLength);
		if (oReallocatedHostname == 0) {
			printf("Failed to realocate memory for hostname");
			free(oHostName);
			return 1;
		}

		oHostName = oReallocatedHostname;
		oHostName[oHostNameLength - 1] = 0;
		if (gethostname(oHostName,oHostNameLength - 1) == 0) {
			size_t iCount = strlen(oHostName);
			if (iCount < oHostNameLength - 2) break;
		}

		oHostNameLength *= 2;
	}

	struct addrinfo oHints = {0};
	oHints.ai_family = AF_UNSPEC;
	oHints.ai_flags = AI_CANONNAME;

	struct addrinfo* oAdressInfo = 0;
	if (getaddrinfo(oHostName,0,&oHints,&oAdressInfo) == 0) {
		printf("oAdressInfo->ai_canonname %s\n",oAdressInfo->ai_canonname);
		freeaddrinfo(oAdressInfo);
	} else {
		printf("hostname %s\n",oHostName);
	}

	free(oHostName);

	return 0;
}
