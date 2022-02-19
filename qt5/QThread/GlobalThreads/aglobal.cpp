// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 07:48:36
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn AGlobal::AGlobal(QObject *parent) : QObject(parent)

	Class constructor.
*/

AGlobal::AGlobal(QObject *parent) : QObject(parent) {

	pThreadNormal = new QThread(this);
	pThreadNormal->start();
	pThreadNormal->setPriority(QThread::Priority::NormalPriority);

	pThreadLow = new QThread(this);
	pThreadLow->start();
	pThreadLow->setPriority(QThread::Priority::LowPriority);

	pThreadLowest = new QThread(this);
	pThreadLowest->start();
	pThreadLowest->setPriority(QThread::Priority::LowestPriority);
}


// -----------
/*!
	\fn AGlobal::~AGlobal(void)

	Class destructor.
*/

AGlobal::~AGlobal(void) {

	pThreadNormal->quit();
	pThreadNormal->wait();

	pThreadLow->quit();
	pThreadLow->wait();

	pThreadLowest->quit();
	pThreadLowest->wait();
}

