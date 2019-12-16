// ----------------------------------------------------------
/*!
	\class ALoop
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:30:37
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aloop.h"


// -----------
/*!
	\fn

	Doc.
*/

ALoop::ALoop(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ALoop::ALoop(QString inName, int inCounter, QObject *parent) : QObject(parent) {

	pName = inName;
	pCounter = inCounter;

	QObject::connect(
		pTimer,SIGNAL(timeout()),
		this,SLOT(mNext())
	);
	QObject::connect(
		this,SIGNAL(sgStart()),
		this,SLOT(mStart())
	);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoop::mRun(void) {

	emit sgStart();
}


// -----------
/*!
	\fn

	Doc.
*/

ALoop::~ALoop(void) {

	mStop();
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoop::mNext(void) {

	--pCounter;
	A_MESSAGE_DEBUG << "Thread:" << QThread::currentThreadId() << "Object name:" << pName << "Counter" << pCounter;
	if (!pCounter) {
		mStop();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoop::mStart(void) {

	pTimer->start(pInterval);
}


// -----------
/*!
	\fn

	Doc.
*/

void ALoop::mStop(void) {

	if (pTimer->isActive()) {
		pTimer->stop();
	}
}
