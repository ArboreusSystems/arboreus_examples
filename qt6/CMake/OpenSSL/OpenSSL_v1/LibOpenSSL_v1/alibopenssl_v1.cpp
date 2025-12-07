/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/09/2025 at 22:52:13
 * */// --------------------------------------------------------------

// Class header
#include "alibopenssl_v1.h"


// -----------
/*!
	\fn

	Doc.
*/

ALibOpenSSL_v1::ALibOpenSSL_v1(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ALibOpenSSL_v1 created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALibOpenSSL_v1::~ALibOpenSSL_v1(void) {

	_A_DEBUG << "ALibOpenSSL_v1 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ALibOpenSSL_v1::mCreateRandom(unsigned char* inKey) {

	if (1 != RAND_bytes(inKey,sizeof(inKey))) {
		_A_DEBUG << "Can't create random";
	}
}


// -----------
/*!
	\fn

	Doc.
*/

vector<unsigned char> ALibOpenSSL_v1::mEncrypt(
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

string ALibOpenSSL_v1::mDecrypt(
	const vector<unsigned char>& inEncryptedChars,
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

