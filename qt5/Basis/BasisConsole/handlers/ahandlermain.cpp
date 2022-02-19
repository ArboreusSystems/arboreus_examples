// ----------------------------------------------------------
/*!
	\class aHandlerMain
	\title Experiement extended handler
	\brief Accumulate small functions that is standing outside of topic of tests

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 03/08/2019 at 11:51:18
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ahandlermain.h"


// -----------
/*!
	\fn aHandlerMain::aHandlerMain(QObject *parent) : QObject(parent)

	Class constructor.
*/

aHandlerMain::aHandlerMain(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn aHandlerMain::~aHandlerMain(void)

	Class destructor.
*/

aHandlerMain::~aHandlerMain(void) {}


// -----------
/*!
	\fn QString aHandlerMain::mStringDictionary(QVector<aDictionaryType> inSchema)

	Return dictionary string of latin codepage based on schema.
*/

QString aHandlerMain::mStringDictionary(QVector<aDictionaryType> inSchema) {

	QString oDictionary = "";
	QString oPartSymbolic = "±!@#$%^&*()_+=-§`~/?\'[]{};:";
	QString oPartNumeric = "1234567890";
	QString oPartAlphaLower = "abcdefghijklmnopqrstuvwxyz";
	QString oPartAlphaUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	QVector<aDictionaryType>::iterator oSchemaIterator = inSchema.begin();
	for (; oSchemaIterator != inSchema.end(); ++oSchemaIterator) {
		switch (*oSchemaIterator) {
		case aDictionaryType::AlphaLower:
			oDictionary += oPartAlphaLower;
			break;
		case aDictionaryType::AlphaUpper:
			oDictionary += oPartAlphaUpper;
			break;
		case aDictionaryType::Numeric:
			oDictionary += oPartNumeric;
			break;
		default:
			oDictionary += oPartSymbolic;
			break;
		}
	}
	return oDictionary;
}


// -----------
/*!
	\fn QString aHandlerMain::mStringRandom(int inLength,QString inDictionary)

	Return random string of defined lenth based on dictionary string.
*/

QString aHandlerMain::mStringRandom(int inLength,QString inDictionary) {

	QString oRandomString = "";
	int oDictionaryLength = inDictionary.count() - 1;
	while (inLength != 0) {
		QRandomGenerator::securelySeeded();
		oRandomString += inDictionary.midRef((QRandomGenerator::global()->generate() % oDictionaryLength) + 1,1);
		--inLength;
	}
	return oRandomString;
}


// -----------
/*!
	\fn int aHandlerMain::mNumberRandomInRange(int inA, int inB)

	Return random number from defined range
*/

int aHandlerMain::mNumberRandomFromRange(int inA, int inB) {

	int oMinimum = 0; int oMaximum = 0;
	if (inA > inB) {
		oMaximum = inA; oMinimum = inB;
	} else {
		oMaximum = inB; oMinimum = inA;
	}
	QRandomGenerator::securelySeeded();
	QRandomGenerator *oGenerator = new QRandomGenerator();
	return oGenerator->bounded(oMinimum,oMaximum);
}
