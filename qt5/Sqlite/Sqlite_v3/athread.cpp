// ----------------------------------------------------------
/*!
	\class AThread
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 11:51:48
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

AThread::AThread(QObject* parent) : QThread(parent) {

	ALOG_SYSTEM << "AThread created";
}


// -----------
/*!
	\fn

	Doc.
*/

AThread::~AThread(void) {

	this->quit();
	this->wait();

	ALOG_SYSTEM << "AThread deleted";
}
