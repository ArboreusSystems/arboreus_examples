/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/09/2025 at 22:52:13
 * */// --------------------------------------------------------------

// Class header
#include "alibopenssl_v3.h"


// -----------
/*!
	\fn

	Doc.
*/

ALibOpenSSL_v3::ALibOpenSSL_v3(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ALibOpenSSL_v3 created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALibOpenSSL_v3::~ALibOpenSSL_v3(void) {

	_A_DEBUG << "ALibOpenSSL_v3 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QByteArray ALibOpenSSL_v3::mEncryptString(
	const QString& inString,
	const QByteArray& inKey,
	const QByteArray& inVector
) {

	QByteArray oBytes = inString.toUtf8();
	QByteArray oEncryptedBytes = mEncryptAES256CBC(oBytes,inKey,inVector);
	return oEncryptedBytes.toBase64();
}


// -----------
/*!
	\fn

	Doc.
*/

QString ALibOpenSSL_v3::mDecryptString(
	const QByteArray& inBytes,
	const QByteArray& inKey,
	const QByteArray& inVector
) {

	QByteArray oEncryptedBytes = QByteArray::fromBase64(inBytes);
	QByteArray oDecryptedBytes = mDdecryptAES256CBC(oEncryptedBytes,inKey,inVector);
	return QString::fromUtf8(oDecryptedBytes);
}


// -----------
/*!
	\fn

	Doc.
*/

QByteArray ALibOpenSSL_v3::mEncryptAES256CBC(
	const QByteArray& inBytes,
	const QByteArray& inKey,
	const QByteArray& inVector
) {

	EVP_CIPHER_CTX* oContext = EVP_CIPHER_CTX_new();
	if (!oContext) {
		_A_DEBUG << "Context not created";
		return QByteArray();
	}

	int oLengthEncryptedBytes = inBytes.size() + EVP_MAX_BLOCK_LENGTH;
	int oLength;
	int oLengthTotal = 0;

	QByteArray oEncryptedBytes(oLengthEncryptedBytes, 0);

	int oEncryptInit = EVP_EncryptInit_ex(
		oContext,EVP_aes_256_cbc(),NULL,
		(const unsigned char*)inKey.constData(),
		(const unsigned char*)inVector.constData()
	);
	if (1 != oEncryptInit) {
		_A_DEBUG << "EVP_EncryptInit_ex failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}

	int oEncryptUpdate = EVP_EncryptUpdate(
		oContext,(unsigned char*)oEncryptedBytes.data(),
		&oLength,(const unsigned char*)inBytes.constData(),inBytes.size()
	);
	if (1 != oEncryptUpdate) {
		_A_DEBUG << "EVP_EncryptUpdate failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}
	oLengthTotal = oLength;

	int EncryptFinal = EVP_EncryptFinal_ex(
		oContext,(unsigned char*)oEncryptedBytes.data() + oLength,&oLength
	);
	if (1 != EncryptFinal) {
		_A_DEBUG << "EVP_EncryptFinal_ex failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}
	oLengthTotal += oLength;

	EVP_CIPHER_CTX_free(oContext);
	oEncryptedBytes.resize(oLengthTotal);

	return oEncryptedBytes;
}


// -----------
/*!
	\fn

	Doc.
*/

QByteArray ALibOpenSSL_v3::mDdecryptAES256CBC(
	const QByteArray& inBytes,
	const QByteArray& inKey,
	const QByteArray& inVector
) {

	EVP_CIPHER_CTX* oContext = EVP_CIPHER_CTX_new();
	if (!oContext) {
		_A_DEBUG << "Context not created";
		return QByteArray();
	}

	int oLength;
	int oLengthTotal = 0;

	QByteArray oDecryptedText(inBytes.size() + EVP_MAX_BLOCK_LENGTH, 0);

	int oDecryptInit = EVP_DecryptInit_ex(
		oContext,EVP_aes_256_cbc(),NULL,
		(const unsigned char*)inKey.constData(),
		(const unsigned char*)inVector.constData()
	);
	if (1 != oDecryptInit) {
		_A_DEBUG << "EVP_DecryptInit_ex failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}

	int oDecryptUpdate = EVP_DecryptUpdate(
		oContext,(unsigned char*)oDecryptedText.data(),
		&oLength,(const unsigned char*)inBytes.constData(),
		inBytes.size()
	);
	if (1 != oDecryptUpdate) {
		_A_DEBUG << "EVP_DecryptUpdate failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}
	oLengthTotal = oLength;

	int DecryptFinal = EVP_DecryptFinal_ex(
		oContext,(unsigned char*)oDecryptedText.data() + oLength,&oLength
	);
	if (1 != DecryptFinal) {
		_A_DEBUG << "EVP_DecryptFinal_ex failed";
		EVP_CIPHER_CTX_free(oContext);
		return QByteArray();
	}
	oLengthTotal += oLength;

	EVP_CIPHER_CTX_free(oContext);
	oDecryptedText.resize(oLengthTotal);

	return oDecryptedText;
}


