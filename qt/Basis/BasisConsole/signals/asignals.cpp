// ----------------------------------------------------------
/*!
	\class aSignals
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 18:00:47
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asignals.h"


// -----------
/*!
	\fn aSignals::aSignals(QObject *parent) : QObject(parent)

	Doc.
*/

aSignals::aSignals(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn aSignals::~aSignals(void)

	Doc.
*/

aSignals::~aSignals(void) {}


// -----------
/*!
	\fn aSignals::~aSignals(void)

	Doc.
*/

void aSignals::mDoTest(void) {

	quint32 oNumber = 0;
	for (int i = 0; i < 50; i++) {
		QRandomGenerator::securelySeeded();
		oNumber = QRandomGenerator::global()->generate() % 100;
		aLOG << "aSignals -> Iteration:" << i << "Number:" << oNumber;
		if (!(oNumber % 5)) {
			emit mDoSignal(oNumber,i);
		}
	}
}
