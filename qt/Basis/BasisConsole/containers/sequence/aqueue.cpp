// ----------------------------------------------------------
/*!
	\class aQueue
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:06:56
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aqueue.h"


// -----------
/*!
	\fn

	Doc.
*/

aQueue::aQueue(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aQueue::~aQueue(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aQueue::mDoTest(void) {

	QQueue<QString> oQueue;
	oQueue.enqueue("1");
	oQueue.enqueue("2");
	oQueue.enqueue("3");
	oQueue.enqueue("4");
	oQueue.enqueue("5");

	while (!oQueue.empty()) {
		aLOG << oQueue.dequeue();
	}
}
