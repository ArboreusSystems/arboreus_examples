// ----------------------------------------------------------
/*!
	\class aProperty
	\title Q_PROPERTY demo
	\brief The demo class for demonstrating Q_PROPERTY functionality

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 14:57:05
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperty.h"





// -----------
/*!
	\fn aProperty::aProperty(QObject *parent) : QObject(parent)

	Class constructor.
*/

aProperty::aProperty(QObject *parent) : QObject(parent) {

	pTestStringRO = new QString("Initialised value of RO String");
	pTestStringRW = new QString("Initialised value of RW String");
}


// -----------
/*!
	\fn aProperty::aProperty(QObject *parent) : QObject(parent)

	Class destructor.
*/

aProperty::~aProperty(void) {}


// -----------
/*!
	\fn QString *aProperty::mGetStringRO(void)

	Return read-only string.
*/

QString aProperty::mGetStringRO(void) {

	return *pTestStringRO;
}


// -----------
/*!
	\fn QString *aProperty::mGetStringRW(void)

	Return read-write string.
*/

QString aProperty::mGetStringRW(void) {

	return *pTestStringRW;
}


// -----------
/*!
	\fn QString *aProperty::mGetStringRW(void)

	Set read-write string up.
*/

void aProperty::mSetStringRW(QString inString) {

	*pTestStringRW = inString;
}
