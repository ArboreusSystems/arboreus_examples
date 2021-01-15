// ----------------------------------------------------------
/*!
	\class AThreadTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 20:14:42
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "athreadtemplate.h"


// -----------
/*!
	\fn

	Doc.
*/

AThreadTemplate::AThreadTemplate(QObject *parent) : QThread(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AThreadTemplate::~AThreadTemplate(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AThreadTemplate::mStart(QThread::Priority inPriority) {

	this->start(inPriority);
}


// -----------
/*!
	\fn

	Doc.
*/

void AThreadTemplate::mQuit(void) {

	this->quit();
	this->wait();
}


// -----------
/*!
	\fn

	Doc.
*/

void AThreadTemplate::mTerminate(void) {

	this->terminate();
	this->wait();
}
