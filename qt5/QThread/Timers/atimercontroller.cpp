#include "atimercontroller.h"

ATimerController::ATimerController(QObject *parent) : QObject(parent) {

	aLOG << "ATimerController created";
}

ATimerController::~ATimerController(void) {

	aLOG << "ATimerController deleted";
}

void ATimerController::mStartTimer(void) {

	emit sgStartTimer();
	aLOG << "ATimerController::mStartTimer from" << QThread::currentThreadId();
}

void ATimerController::mStopTimer(void) {

	emit sgStopTimer();
	aLOG << "ATimerController::mStopTimer from " << QThread::currentThreadId();
}
