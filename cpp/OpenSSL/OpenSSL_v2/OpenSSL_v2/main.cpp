/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/11/2025 at 13:35:12
 * */// --------------------------------------------------------------

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Definitions
#define BUFF_SIZE 4096


// Console Application
int main(int inCounter, char *inArguments[]) {

	char buff[BUFF_SIZE];
	unsigned int oMD5Length;
	unsigned char oHash[EVP_MAX_MD_SIZE];
	char* oString = "Test string for MD5 HASH demo";

	EVP_MD_CTX* oMD5Context = EVP_MD_CTX_new();
	const EVP_MD* EVP_md5();

	int oEVP_DigestInit_ex = EVP_DigestInit_ex(oMD5Context,EVP_md5(),NULL);
	if (1 != oEVP_DigestInit_ex) throw runtime_error("Failed EVP_DigestInit_ex");

	int oEVP_DigestUpdate = EVP_DigestUpdate(oMD5Context,oString,strlen(oString));
	if (1 != oEVP_DigestUpdate) throw runtime_error("Failed EVP_DigestUpdate");

	int oEVP_DigestFinal_ex = EVP_DigestFinal_ex(oMD5Context, oHash, &oMD5Length);
	if (1 != oEVP_DigestFinal_ex) throw runtime_error("Failed EVP_DigestUpdate");

	for (int i = 0; i < oMD5Length; i++) {
		printf("%02x",oHash[i]);
	}
	printf(" %s\n",oString);

	return 0;
}
