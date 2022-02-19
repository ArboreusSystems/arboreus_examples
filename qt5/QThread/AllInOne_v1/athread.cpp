// ----------------------------------------------------------
/*!
	\class AThread
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:00:58
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "athread.h"


// -----------
/*!
	\fn

	Doc.
*/

AThread::AThread(QObject *parent) : QThread(parent) {

	ALOG << "AThread created";
}


// -----------
/*!
	\fn

	Doc.
*/

AThread::~AThread(void) {

	ALOG << "AThread deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AThread::mQuit(void) {

	this->quit();
	this->wait();
}


// -----------
/*!
	\fn

	Doc.
*/

void AThread::mTerminate(void) {

	this->terminate();
	this->wait();
}
