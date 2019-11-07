#include "aobject3.h"


aObject3::aObject3(QObject *parent) : QObject(parent) {

	aLOG << "Object3: created";
}

aObject3::~aObject3(void) {

	aLOG << "Object3: deleted";
}

QString aObject3::mTestString(void) {

	return *pTestString;
}

void aObject3::mSetup() {

	pTestString = new QString("Test string from aObject3");
	aLOG << "aObject3: setted up";
	QTimer::singleShot(1000,this,SIGNAL(sCreated()));
}
