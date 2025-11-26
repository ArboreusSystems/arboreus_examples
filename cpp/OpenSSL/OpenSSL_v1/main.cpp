/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 09/09/2025 at 18:12:46
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

vector<unsigned char> fEncrypt(
	const string& inString,
	const unsigned char* inKey,
	const unsigned char* inVector
) {

	EVP_CIPHER_CTX *oContextRaw = EVP_CIPHER_CTX_new();

	unique_ptr<EVP_CIPHER_CTX,decltype(&EVP_CIPHER_CTX_free)> oContext(oContextRaw,EVP_CIPHER_CTX_free);
	if (!oContext) throw runtime_error("Failed EVP_CIPHER_CTX_new");

	int oEVP_EncryptInit_ex = EVP_EncryptInit_ex(
		oContext.get(),EVP_aes_256_cbc(),
		NULL,inKey,inVector
	);
	if (1 != oEVP_EncryptInit_ex) throw runtime_error("Failed EVP_EncryptInit_ex");

	vector<unsigned char> oEncryptedChars(inString.size() + EVP_MAX_BLOCK_LENGTH);
	int oLength = 0;
	int oEncryptedCharsLength = 0;

	int oEVP_EncryptUpdate = EVP_EncryptUpdate(
		oContext.get(),oEncryptedChars.data(),&oLength,
		(const unsigned char*)inString.c_str(), inString.size()
	);
	if (1 != oEVP_EncryptUpdate) throw runtime_error("Failed EVP_EncryptUpdate failed");

	oEncryptedCharsLength = oLength;

	int oEVP_EncryptFinal_ex = EVP_EncryptFinal_ex(
		oContext.get(),
		oEncryptedChars.data() + oLength,
		&oLength
	);
	if (1 != oEVP_EncryptFinal_ex) throw runtime_error("Failed Failed EVP_EncryptFinal_ex");

	oEncryptedCharsLength += oLength;

	oEncryptedChars.resize(oEncryptedCharsLength);
	return oEncryptedChars;
}


// -----------
/*!
	\fn

	Doc.
*/

std::string fDecrypt(
	const std::vector<unsigned char>& inEncryptedChars,
	const unsigned char* inKey,
	const unsigned char* inVector
) {

	EVP_CIPHER_CTX* oContextRaw = EVP_CIPHER_CTX_new();

	unique_ptr<EVP_CIPHER_CTX,decltype(&EVP_CIPHER_CTX_free)> oContext(oContextRaw,EVP_CIPHER_CTX_free);
	if (!oContext) throw runtime_error("Failed EVP_CIPHER_CTX_new");

	int oEVP_DecryptInit_ex = EVP_DecryptInit_ex(
		oContext.get(),EVP_aes_256_cbc(),NULL,
		inKey,inVector
	);
	if (1 != oEVP_DecryptInit_ex) throw runtime_error("Failed EVP_DecryptInit_ex");

	vector<unsigned char> oDecryptedString(inEncryptedChars.size());
	int oLength = 0;
	int oDecryptedStringLength = 0;

	int oEVP_DecryptUpdate = EVP_DecryptUpdate(
		oContext.get(),oDecryptedString.data(),&oLength,
		inEncryptedChars.data(),
		inEncryptedChars.size()
	);
	if (1 != oEVP_DecryptUpdate) throw runtime_error("Failed EVP_DecryptUpdate failed");
	oDecryptedStringLength = oLength;

	int oEVP_DecryptFinal_ex = EVP_DecryptFinal_ex(
		oContext.get(),
		oDecryptedString.data() + oLength,
		&oLength
	);
	if (1 != oEVP_DecryptFinal_ex) runtime_error("Failed EVP_DecryptFinal_ex");
	oDecryptedStringLength += oLength;

	return string(oDecryptedString.begin(),oDecryptedString.begin() + oDecryptedStringLength);
}


// -----------
/*!
	\fn

	Doc.
*/

char fCastFromUnsigned(unsigned char inChar) {

	return static_cast<char>(inChar);
}


// Console Application
int main(int inCounter, char* inArguments[]) {

	unsigned char oKey[55];
	if (1 != RAND_bytes(oKey, sizeof(oKey))) {
		cout << "Can't create key" << endl;
	}

	unsigned char oVector[11];
	if (1 != RAND_bytes(oVector, sizeof(oVector))) {
		cout << "Can't create vector" << endl;
	}

	string oString = "This is a string to be encrypted.";

	try {

		vector<unsigned char> ciphertext = fEncrypt(oString, oKey, oVector);
		string oEncryptedString;
		oEncryptedString.reserve(ciphertext.size());
		transform(ciphertext.begin(),ciphertext.end(),back_inserter(oEncryptedString),fCastFromUnsigned);

		cout << "Original string: " << oString << endl;
		cout << "Encrypted string: " << oEncryptedString << endl;
		cout << "Ciphertext string: " << ciphertext.size() << " bytes" << endl;

		string decryptedtext = fDecrypt(ciphertext, oKey, oVector);

		cout << "Decrypted string: " << decryptedtext << endl;

	} catch (const std::runtime_error& e) {
		cerr << "Error: " << e.what() << endl;
		return 1;
	}

	return 0;
}
