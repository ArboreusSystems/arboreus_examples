// ----------------------------------------------------------
/*!
	\class OOPSingletoneQt
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 05/09/2019 at 13:07:55
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "oopsingletoneqt.h"


// -----------
/*!
	\fn

	Doc.

*/

OOPSingletoneQt::OOPSingletoneQt(QObject *parent) : QObject(parent) {

	aLOG << "OOPSingletoneQt::OOPSingletoneQt(QObject *parent) : QObject(parent)";
	pTestString = new QString("Initial value");
}


// -----------
/*!
	\fn

	Doc.

*/

OOPSingletoneQt::~OOPSingletoneQt(void) {

	aLOG << "OOPSingletoneQt::~OOPSingletoneQt(void)";
}

