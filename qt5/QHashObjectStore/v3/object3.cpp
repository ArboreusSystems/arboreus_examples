#include "object3.h"

Object3::Object3(QObject *parent) : ObjectPrimitive(parent) {

	pTestString = "Object3";
	pTestPublicString = pTestString + "_public";
}

Object3::~Object3(void) {}
