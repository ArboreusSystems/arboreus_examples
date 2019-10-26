#include "dispatcher.h"

Dispatcher::Dispatcher(QObject *parent) : QObject(parent) {

	pObjects = QHash<QString,ObjectPrimitive*>();
}

Dispatcher::~Dispatcher(void) {

}

bool Dispatcher::mCreate(QString inName, ObjectTypes inType) {

	ObjectPrimitive *oObject;
	oObject = pObjects.value(inName);
	if (!oObject) {
		switch (inType) {
			case ObjectTypes::Object1:
				pObjects.insert(inName,new Object1());
				return true;
			case ObjectTypes::Object2:
				pObjects.insert(inName,new Object2());
				return true;
			case ObjectTypes::Object3:
				pObjects.insert(inName,new Object3());
				return true;
			default:
				return false;
		}
	}

	return false;
}

QHash<bool,ObjectPrimitive*> Dispatcher::mGetObject(QString inName) {

	ObjectPrimitive *oObject;
	QHash<bool,ObjectPrimitive*> oResult = QHash<bool,ObjectPrimitive*>();

	oObject = pObjects.value(inName);
	if (!oObject) {
		oResult.insert(false,oObject);
	} else {
		oResult.insert(true,oObject);
	}

	return oResult;
}
