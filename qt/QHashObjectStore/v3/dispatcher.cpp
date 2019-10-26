#include "dispatcher.h"

Dispatcher::Dispatcher(QObject *parent) : QObject(parent) {

	pObjects = QHash<QString,ObjectPrimitive*>();

	aLOG << "oDispatcher->mCreate(\"1\",ObjectTypes::Object1) =" << mCreate("1",ObjectTypes::Object1);
	aLOG << "oDispatcher->mCreate(\"2\",ObjectTypes::Object3) =" << mCreate("2",ObjectTypes::Object3);
	aLOG << "oDispatcher->mCreate(\"3\",ObjectTypes::Object1) =" << mCreate("3",ObjectTypes::Object1);
	aLOG << "oDispatcher->mCreate(\"4\",ObjectTypes::Object2) =" << mCreate("4",ObjectTypes::Object2);
	aLOG << "oDispatcher->mCreate(\"5\",ObjectTypes::Object2) =" << mCreate("5",ObjectTypes::Object2);
	aLOG << "oDispatcher->mCreate(\"6\",ObjectTypes::Object1) =" << mCreate("6",ObjectTypes::Object3);
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

ObjectPrimitive* Dispatcher::mGetSimpleObject(QString inName) {

	ObjectPrimitive *oObject;
	oObject = pObjects.value(inName);
	return oObject;
}

QVariantList Dispatcher::mGetListOfObjects(void) {

	QVariantList *oResult = new QVariantList();
	int iCounter = 0;

	for (
		QHash<QString,ObjectPrimitive*>::iterator i = pObjects.begin();
		i != pObjects.end();
		++i
	) {
		oResult->insert(iCounter,i.value()->pTestPublicString);
		iCounter++;
	}

	return *oResult;
}
