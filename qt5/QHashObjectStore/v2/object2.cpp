#include "object2.h"

Object2::Object2(QObject *parent) : ObjectPrimitive(parent) {

	pTestString = "Object2";
	pTestPublicString = pTestString + "_public";
}

Object2::~Object2(void) {}
