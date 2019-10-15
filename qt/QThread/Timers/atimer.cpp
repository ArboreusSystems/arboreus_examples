#include "atimer.h"

ATimer::ATimer(QThread::Priority inPriority,QObject *inParent) : QThread(inParent) {

	aLOG << "ATimer created";
	pPriority = inPriority;
	pTimer = new QTimer(this);
	pCounter = 0;
	pInterval = 500;
	pTimer->setInterval(pInterval);

	QObject::connect(
		pTimer,SIGNAL(timeout()),
		this,SLOT(slAction())
	);
	QObject::connect(
		this,SIGNAL(sgStartTimer()),
		this,SLOT(slStartTimer())
	);
	QObject::connect(
		this,SIGNAL(sgStopTimer()),
		this,SLOT(slStopTimer())
	);
}

ATimer::~ATimer(void) {

	aLOG << "ATimer deleted";
}

void ATimer::run(void) {

	aLOG << "ATimer run";
}

void ATimer::slAction(void) {

	aLOG << "Counter:" << ++pCounter;
}

void ATimer::slStartTimer(void) {

	pTimer->start();
	aLOG << "ATimer started";
}

void ATimer::slStopTimer(void) {

	pTimer->stop();
	aLOG << "ATimer stopped";
}
