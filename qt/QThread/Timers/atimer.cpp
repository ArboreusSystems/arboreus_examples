#include "atimer.h"

ATimer::ATimer(QObject *parent) : QObject(parent) {

	aLOG << "ATimer created";
	pTimer = new QTimer(this);
	pInterval = 500;
	pTimer->setInterval(pInterval);
	pCounter = 0;

	QObject::connect(
		pTimer,SIGNAL(timeout()),
		this,SLOT(slAction())
	);
}

ATimer::~ATimer(void) {

	aLOG << "ATimer deleted";
}

void ATimer::slAction(void) {

	aLOG << "Thread ID:" << QThread::currentThreadId() << "Counter:" << ++pCounter;
}

void ATimer::slStartTimer(void) {

	pTimer->start();
	aLOG << "ATimer started";
}

void ATimer::slStopTimer(void) {

	pTimer->stop();
	aLOG << "ATimer stoped";
}
