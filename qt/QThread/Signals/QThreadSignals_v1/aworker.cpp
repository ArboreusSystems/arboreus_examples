#include "aworker.h"


AWorker::AWorker(QObject *inParent) : QObject(inParent) {

	aLOG << "AWorker created";
	pTimer = new QTimer();
	pCounter = 15;

	QObject::connect(
		pTimer,SIGNAL(timeout()),
		this,SLOT(slSetNext())
	);

	QObject::connect(
		this,SIGNAL(sgFinished()),
		this,SLOT(slStopDemo())
	);
}

AWorker::~AWorker(void) {

	aLOG << "AWorker deleted";
}

void AWorker::slStartDemo(void) {

	pTimer->start(1000);
	aLOG << "Started";
}

void AWorker::slSetNext(void) {

	emit sgValueGanged(--pCounter);
	aLOG << "Counter:" << pCounter;
	if (!pCounter) {
		pTimer->stop();
		emit sgFinished();
	}
}

void AWorker::slStopDemo(void) {

	aLOG << "Finished";
}
