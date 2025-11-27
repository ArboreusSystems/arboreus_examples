/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/11/2025 at 08:42:47
 * */// --------------------------------------------------------------

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Namesapce
using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

struct AStructOpenSSL {

	void operator()(void* ptr) {

		EVP_MD_CTX_free((EVP_MD_CTX*)ptr);
	}
};


// -----------
/*!
	\fn

	Doc.
*/

template <typename Type>
using OpenSSLPointer = unique_ptr<Type,AStructOpenSSL>;


// -----------
/*!
	\fn

	Doc.
*/

bool computeHash(const string& inString, string& inHash) {

	unsigned char oHash[EVP_MAX_MD_SIZE];
	unsigned int oLengthHash = 0;

	OpenSSLPointer<EVP_MD_CTX> oContext(EVP_MD_CTX_new());

	if (oContext.get() == NULL) return false;
	if (!EVP_DigestInit_ex(oContext.get(),EVP_sha256(),NULL)) return false;
	if (!EVP_DigestUpdate(oContext.get(),inString.c_str(),inString.length())) return false;
	if (!EVP_DigestFinal_ex(oContext.get(),oHash,&oLengthHash)) return false;

	stringstream oStream;
	for (unsigned int i = 0; i < oLengthHash; ++i) {
		oStream << hex << setw(2) << setfill('0') << (int)oHash[i];
	}

	inHash = oStream.str();
	return true;
}

// Console Application
int main(int inCounter, char* inArguments[]) {

	string oString = "StringForHash";
	string oHashed = "";

	if (computeHash(oString,oHashed)) {
		cout << "String: \"" << oString << "\", HASH: \"" << oHashed << "\"" << endl;
	} else {
		cout << "String can't be hashed";
	}

	return 0;
}
