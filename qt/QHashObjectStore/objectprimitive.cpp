#include "objectprimitive.h"

ObjectPrimitive::ObjectPrimitive(QObject *parent) : QObject(parent) {}

ObjectPrimitive::~ObjectPrimitive(void) {}

QString ObjectPrimitive::mTestString(void) {

	return pTestString;
}


