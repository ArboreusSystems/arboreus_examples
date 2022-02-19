// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:39:08
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject *parent) : QObject(parent) {

	A_CONSOLE_MESSAGE_DEBUG("ABackend created");
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void) {

	this->mDeleteThreads();
	A_CONSOLE_MESSAGE_DEBUG("ABackend deleted");
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend& ABackend::mInstance(void) {

	static ABackend oInstance;
	A_CONSOLE_MESSAGE_DEBUG("ABackend instantiated");
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mInit(void) {

	this->mInitThreads();
	this->mInitLogger();
	A_CONSOLE_MESSAGE_DEBUG("ABackend initialised");
}


// -----------
/*!
	\fn

	Doc.
*/


void ABackend::mInitThreads(void) {

	pThreadLowest = new AThreadTemplate(this);
	pThreadLowest->mStart(QThread::Priority::LowestPriority);

	pThreadLow = new AThreadTemplate(this);
	pThreadLow->mStart(QThread::Priority::LowPriority);

	pThreadNormal = new AThreadTemplate(this);
	pThreadNormal->mStart(QThread::Priority::NormalPriority);

	pThreadHigh = new AThreadTemplate(this);
	pThreadHigh->mStart(QThread::Priority::HighPriority);

	pThreadHighest = new AThreadTemplate(this);
	pThreadHighest->mStart(QThread::Priority::HighestPriority);
}


// -----------
/*!
	\fn

	Doc.
*/

void ABackend::mDeleteThreads(void) {

	pThreadHighest->mQuit();
	pThreadHigh->mQuit();
	pThreadNormal->mQuit();
	pThreadLow->mQuit();
	pThreadLowest->mQuit();
}


// -----------
/*!
	\fn

	Doc.
*/


void ABackend::mInitLogger(void) {

	if (pLogger) {
		pRootContext->setContextProperty("ALogger",pLogger);
		pLogger->mInitWithThread(pThreadLow);
	}
}
