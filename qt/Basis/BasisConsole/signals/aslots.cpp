// ----------------------------------------------------------
/*!
	\class aSlots
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 18:02:17
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aslots.h"





// -----------
/*!
	\fn aSlots::aSlots(QObject *parent) : QObject(parent)

	Doc.
*/

aSlots::aSlots(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn aSlots::~aSlots(void)

	Doc.
*/

aSlots::~aSlots(void) {}


// -----------
/*!
	\fn aSlots::mDoSlot(quint32 inNumber, int inIteration)

	Test slot functionality.
*/

void aSlots::mDoSlot(quint32 inNumber, int inIteration) {

	aLOG << "aSlots -> Number:" << inNumber << "from iteration:" << inIteration;
}
