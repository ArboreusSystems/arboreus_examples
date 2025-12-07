// ----------------------------------------------------------
/*!
	\class AOpenSSL
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/12/2025 at 07:54:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aopenssl.h"



// -----------
/*!
	\fn

	Doc.
*/

char fCastFromUnsigned(unsigned char inChar) {

	return static_cast<char>(inChar);
}


// -----------
/*!
	\fn

	Doc.
*/

AOpenSSL::AOpenSSL(QObject* parent) : QObject{parent} {

	pLib = new ALibOpenSSL_v2(this);

	_A_DEBUG << "AOpenSSL created";
}


// -----------
/*!
	\fn

	Doc.
*/

AOpenSSL::~AOpenSSL(void) {

	_A_DEBUG << "AOpenSSL deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AOpenSSL::mEncode(QString inString) {

	string oSTDString = inString.toStdString();
	vector<unsigned char> oEncrypted = pLib->mEncrypt(oSTDString,pPassword,pVector);
	QByteArray oByteArray(reinterpret_cast<const char*>(oEncrypted.data()),oEncrypted.size());
	QByteArray oBase64Bytes = oByteArray.toBase64();
	QString oEncryptedString = QString::fromUtf8(oBase64Bytes.data(),oBase64Bytes.size());

	return oEncryptedString;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AOpenSSL::mDecode(QString inString) {

	QByteArray oBase64Bytes = inString.toUtf8();
	QByteArray oEncryptedBytes = QByteArray::fromBase64(oBase64Bytes);

	const unsigned char* oBegin = reinterpret_cast<unsigned char*>(oEncryptedBytes.data());
	const unsigned char* oEnd = oBegin + oEncryptedBytes.length();
	vector<unsigned char> oEncryptedChars(oBegin,oEnd);
	string oDecodedString = pLib->mDecrypt(oEncryptedChars,pPassword,pVector);

	_A_DEBUG << "1111" << oDecodedString;

	return QString::fromStdString(oDecodedString);
}


// -----------
/*!
	\fn

	Doc.
*/

void AOpenSSL::mSetPassword(QString inPassword) {

	QByteArray oByteArray = QByteArray::fromHex(inPassword.toLatin1());
	pPassword = reinterpret_cast<const unsigned char *>(oByteArray.constData());
}


// -----------
/*!
	\fn

	Doc.
*/

void AOpenSSL::mSetVector(QString inVector) {

	QByteArray oByteArray = QByteArray::fromHex(inVector.toLatin1());
	pVector = reinterpret_cast<const unsigned char *>(oByteArray.constData());
}

