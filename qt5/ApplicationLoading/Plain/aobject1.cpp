#include "aobject1.h"


aObject1::aObject1(QObject *parent) : QObject(parent) {

	aLOG << "Object1: created";
}

aObject1::~aObject1(void) {

	aLOG << "Object1: deleted";
}

QString aObject1::mTestString(void) {

	return *pTestString;
}

void aObject1::mSetup() {

	pTestString = new QString("Test string from aObject1");
	aLOG << "aObject1: setted up";
	QTimer::singleShot(1000,this,SIGNAL(sCreated()));
}
