#include "aobject2.h"


aObject2::aObject2(QObject *parent) : QObject(parent) {

	aLOG << "Object2: created";
}

aObject2::~aObject2(void) {

	aLOG << "Object2: deleted";
}

QString aObject2::mTestString(void) {

	return *pTestString;
}

void aObject2::mSetup() {

	pTestString = new QString("Test string from aObject2");
	aLOG << "aObject2: setted up";
	QTimer::singleShot(1000,this,SIGNAL(sCreated()));
}
