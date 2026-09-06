// ----------------------------------------------------------
/*!
	\class AModifier
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 18:03:05
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amodifier.h"

// Namespaces
using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

AModifier::AModifier(QObject* parent): QObject{parent} {}


// -----------
/*!
	\fn

	Doc.
*/

AModifier::~AModifier(void) {

	mMemoryClear();
}


// -----------
/*!
	\fn

	Doc.
*/

bool AModifier::mIsPasswordDefined(void) const {

	return !pPasswordBuffer.isEmpty();
}


// -----------
/*!
	\fn

	Doc.
*/

bool AModifier::mPasswordSet(const QString& inPassword, const QByteArray& inSalt) {

	mMemoryClear();

	if (inPassword.isEmpty()) return false;

	QByteArray oPasswordBytes = inPassword.toUtf8();

	pPasswordBuffer.resize(oPasswordBytes.size());
	mLockBuffer(pPasswordBuffer.data(),pPasswordBuffer.size());
	memcpy(pPasswordBuffer.data(),oPasswordBytes.constData(),oPasswordBytes.size());

	QByteArray oLocalSalt = inSalt;
	if (oLocalSalt.isEmpty()) oLocalSalt = QByteArray("!!!ReplaceWithUniqueSalt!!!",44);

	pDerivedKey.resize(__KEY_SIZE);
	mLockBuffer(pDerivedKey.data(),pDerivedKey.size());

	int oResult = PKCS5_PBKDF2_HMAC(
		oPasswordBytes.constData(),
		oPasswordBytes.size(),
		reinterpret_cast<const unsigned char*>(oLocalSalt.constData()), oLocalSalt.size(),
		__PBKDF2_ITERATIONS,
		EVP_sha256(),
		__KEY_SIZE,
		reinterpret_cast<unsigned char*>(pDerivedKey.data())
	);

	mUnlockAndClear(oPasswordBytes.data(),oPasswordBytes.size());

	if (oResult != 1) {
		mMemoryClear();
		_A_CRITICAL << "PBKDF2 Derivation Failed!";
		return false;
	}

	emit sgPasswordChanged();
	return true;
}


// -----------
/*!
	\fn

	Doc.
*/

QString AModifier::mPasswordGet(void) const {

	if (pPasswordBuffer.isEmpty()) return QString();

	return QString::fromUtf8(pPasswordBuffer);
}


// -----------
/*!
	\fn

	Doc.
*/

void AModifier::mMemoryClear(void) {

	if (!pPasswordBuffer.isEmpty()) {
		mUnlockAndClear(pPasswordBuffer.data(),pPasswordBuffer.size());
		pPasswordBuffer.clear();
	}
	if (!pDerivedKey.isEmpty()) {
		mUnlockAndClear(pDerivedKey.data(), pDerivedKey.size());
		pDerivedKey.clear();
	}

	emit sgPasswordChanged();
}


// -----------
/*!
	\fn

	Doc.
*/

void AModifier::mLockBuffer(void* inPointer, size_t inSize) {

	mlock(inPointer,inSize);
}


// -----------
/*!
	\fn

	Doc.
*/

void AModifier::mUnlockAndClear(void* inPointer, size_t inSize) {

	volatile char* oPointer = static_cast<volatile char*>(inPointer);
	while (inSize--) *oPointer++ = 0;
	munlock(inPointer,inSize);
}
