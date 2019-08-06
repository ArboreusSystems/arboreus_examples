// ----------------------------------------------------------
/*!
	\class aStack
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:04:13
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astack.h"


// -----------
/*!
	\fn

	Doc.
*/

aStack::aStack(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aStack::~aStack(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aStack::mDoTest(void) {

	QStack<QString> oStack1;
	oStack1.push("1");
	oStack1.push("2");
	oStack1.push("3");
	oStack1.push("4");
	oStack1.push("5");
	oStack1.push("6");
	oStack1.push("7");
	oStack1.push("8");
	oStack1.push("9");

	while (!oStack1.empty()) {
		aLOG << oStack1.pop();
	}

	QVector<aDictionaryType> oDictionary = {
		aDictionaryType::Numeric
	};

	QStack<QString> oStack2;
	while (oStack2.count() < A_TEST_ITERATIONS_COUNT) {
		oStack2.push(aHandlerMain::mStringRandom(32,aHandlerMain::mStringDictionary(oDictionary)));
	}

	while (!oStack2.empty()) {
		aLOG << oStack2.pop();
	}
}
