// ----------------------------------------------------------
/*!
	\class ASequenceString
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2022 at 12:35:03
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asequencestring.h"


// -----------
/*!
	\fn

	Doc.
*/

ASequenceString::ASequenceString(QObject* parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ASequenceString::~ASequenceString(void) {}


// -----------
/*!
	\fn QString ASequenceString::mRandomMatrix(int inWidth,int inHeight)

	Generate random string matrix of with and height based on AlphaNumeric dictionary.
*/

QString ASequenceString::mRandomMatrix(int inWidth,int inHeight) {

	return mRandomMatrix(
		inWidth,inHeight,
		mDictionary(_A_ENUM_DICTIONARY_TYPE::AlphaNumeric)
	);
}


// -----------
/*!
	\fn QString ASequenceString::mRandomMatrix(int inWidth, int inHeight, QString inDictionary)

	Generate random string matrix of with and height based on defined dictionary.
*/

QString ASequenceString::mRandomMatrix(int inWidth, int inHeight, QString inDictionary) {

	QString oMatrix;
	for (int i = 0; i < inHeight; ++i) {
		oMatrix += mRandom(inWidth,inDictionary) + QString("\n");
	}
	return oMatrix;
}


// -----------
/*!
	\fn QString ASequenceString::mValue(QString inValue)

	Return full value from QString object.
*/

QString ASequenceString::mValue(QString inValue) {

	QString oString1 = mMd4FromQString(inValue);
	QString::iterator oString1Iterator = oString1.begin();
	QString oString2 = mMd5FromQString(inValue);
	QString::iterator oString2Iterator = oString2.begin();

	QString oOutput = "";
	while (oString1Iterator != oString1.end()) {
		oOutput = oOutput + *oString1Iterator + *oString2Iterator;
		++oString1Iterator; ++ oString2Iterator;
	}

	return oOutput;
}


// -----------
/*!
	\fn QString ASequenceString::mValue(int inLength,QString inValue)

	Return restricted by length value from QString object.
*/

QString ASequenceString::mValue(int inLength,QString inValue) {

	QString oOutut = mValue(inValue);
	if (inLength > oOutut.length()) {
		return oOutut;
	}
	return oOutut.left(inLength);
}


// -----------
/*!
	\fn QString ASequenceString::mValue(int inLength,QString inValue)

	Return restricted by length value from QString object.
*/

QString ASequenceString::mValue(QString inExtention, int inLength, QString inValue) {

	return inExtention + mValue(inLength,inValue);
}


// -----------
/*!
	\fn QString ASequenceString::mMd5ID(void)

	Generate unique ID based on md5-hash from unique random string..
*/

QString ASequenceString::mMd5ID(void) {

	return mMd5FromQString(
		QString::number(QDateTime::currentMSecsSinceEpoch()) + mRandom(1024)
	);
}


// -----------
/*!
	\fn QString ASequenceString::mMd5FromQString(QString inString)

	Generate unique ID based on md4-hash from unique random string.
*/

QString ASequenceString::mMd5FromQString(QString inString) {

	return QString(
		QCryptographicHash::hash(inString.toUtf8(),QCryptographicHash::Md5).toHex()
	);
}


// -----------
/*!
	\fn QString ASequenceString::mMd4ID(void)

	Generate unique ID based on md4-hash from unique random string.
*/

QString ASequenceString::mMd4ID(void) {

	return mMd4FromQString(
		QString::number(QDateTime::currentMSecsSinceEpoch()) + mRandom(1024)
	);
}


// -----------
/*!
	\fn QString ASequenceString::mMd4FromQString(QString inString)

	Generate QString object within unique MD4 sequence based on md4-hash from string.
*/

QString ASequenceString::mMd4FromQString(QString inString) {

	return QString(
		QCryptographicHash::hash(inString.toUtf8(),QCryptographicHash::Md4).toHex()
	);
}


// -----------
/*!
	\fn QString ASequenceString::mRandom(int inLength)

	Return random string sequence based on length and used by default
	pDictionaryType::AlphaNumeric value for dictionary.
*/

QString ASequenceString::mRandom(int inLength) {

	return mRandom(inLength,mDictionary(_A_ENUM_DICTIONARY_TYPE::AlphaNumeric));
}


// -----------
/*!
	\fn QString ASequenceString::mRandom(int inLength,QString inDictionary)

	Return random string sequence based on length and dictionary.
*/

QString ASequenceString::mRandom(int inLength,QString inDictionary) {

	QString vString;
	int vSolt = ASequenceNumber::mRandom(0,256);

	for(int i = 0; i < inLength + vSolt; ++i) {
		int vCharPosition = ASequenceNumber::mRandomPositive() % inDictionary.length();
		QChar vNextChar = inDictionary.at(vCharPosition);
		vString.append(vNextChar);
	}

	return vString.mid(ASequenceNumber::mRandom(0,vSolt - 1),inLength);
}


// -----------
/*!
	\fn QString ASequenceString::mDictionary(_A_ENUM_DICTIONARY_TYPE inType)

	Return QString within dictionary for generating sequence.
*/

QString ASequenceString::mDictionary(_A_ENUM_DICTIONARY_TYPE inType) {

	QString vDictionary;
	switch (inType) {
		case _A_ENUM_DICTIONARY_TYPE::AlphaLower:
			vDictionary = "abcdefghijklmnopqrstuvwxyz";
			break;
		case _A_ENUM_DICTIONARY_TYPE::AlphaUpper:
			vDictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			break;
		case _A_ENUM_DICTIONARY_TYPE::Alpha:
			vDictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			break;
		case _A_ENUM_DICTIONARY_TYPE::AlphaLowerNumeric:
			vDictionary = "abcdefghijklmnopqrstuvwxyz0123456789";
			break;
		case _A_ENUM_DICTIONARY_TYPE::AlphaUpperNumeric:
			vDictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			break;
		case _A_ENUM_DICTIONARY_TYPE::Numeric:
			vDictionary = "0123456789";
			break;
		case _A_ENUM_DICTIONARY_TYPE::Symbols:
			vDictionary = "±!@#$%^&*()_+=-§`?><~{}][ ,.;':";
			break;
		default:
			vDictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			break;
	}
	return vDictionary;
}


// -----------
/*!
	\fn QString ASequenceString::mRegistryValue(QString inFilePath,int inLength)

	Calculating string sequence from defined regidtry file of defined length
*/


QString ASequenceString::mRegistryValue(QString inFilePath,int inLength) {

	QString oRegistryValue = "";
	QDate oDate = QFileInfo(inFilePath).birthTime().date();
	int X = oDate.month();
	int Y = oDate.day();
	int Z = oDate.dayOfWeek();
	QFile oRegistryFile(inFilePath);
	if (oRegistryFile.open(QIODevice::ReadOnly)) {
		QString oString = QTextStream(&oRegistryFile).readAll();
		oString = oString.remove("\n");
		oString = oString.remove(QString::number(Z));
		for (int i = X*Y, j = 0; j < inLength; i += Z, j ++) {
			oRegistryValue = oString.mid(i,1).append(oRegistryValue);
		}
	}
	return oRegistryValue;
}




