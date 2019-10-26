#include <QCoreApplication>
#include "dispatcher.h"
#include "aglobal.h"

int main(int inCounter, char *inArguments[]) {

	QCoreApplication oApplication(inCounter,inArguments);

	Dispatcher *oDispatcher = new Dispatcher();
	aLOG << "oDispatcher->mCreate(\"1\",Dispatcher::ObjectTypes::Object1) =" << oDispatcher->mCreate("1",Dispatcher::ObjectTypes::Object1);
	aLOG << "oDispatcher->mCreate(\"2\",Dispatcher::ObjectTypes::Object3) =" << oDispatcher->mCreate("2",Dispatcher::ObjectTypes::Object3);
	aLOG << "oDispatcher->mCreate(\"3\",Dispatcher::ObjectTypes::Object1) =" << oDispatcher->mCreate("3",Dispatcher::ObjectTypes::Object1);
	aLOG << "oDispatcher->mCreate(\"4\",Dispatcher::ObjectTypes::Object2) =" << oDispatcher->mCreate("4",Dispatcher::ObjectTypes::Object2);
	aLOG << "oDispatcher->mCreate(\"5\",Dispatcher::ObjectTypes::Object2) =" << oDispatcher->mCreate("5",Dispatcher::ObjectTypes::Object2);
	aLOG << "oDispatcher->mCreate(\"6\",Dispatcher::ObjectTypes::Object1) =" << oDispatcher->mCreate("6",Dispatcher::ObjectTypes::Object3);

	QHash<bool,ObjectPrimitive*> oTestDispatcherReply1 = oDispatcher->mGetObject("1");
	ObjectPrimitive *oTestObject1 = oTestDispatcherReply1.value(true);
	if (oTestObject1) {
		aLOG << "oTestObject1->mTestString() =" << oTestObject1->mTestString();
	} else {
		aLOG << oTestObject1;
		aLOG << oTestDispatcherReply1;
	}

	QHash<bool,ObjectPrimitive*> oTestDispatcherReply2 = oDispatcher->mGetObject("2");
	ObjectPrimitive *oTestObject2 = oTestDispatcherReply2.value(true);
	if (oTestObject1) {
		aLOG << "oTestObject2->mTestString() =" << oTestObject2->mTestString();
	} else {
		aLOG << oTestObject2;
		aLOG << oTestDispatcherReply2;
	}

	QHash<bool,ObjectPrimitive*> oTestDispatcherReply3 = oDispatcher->mGetObject("3");
	ObjectPrimitive *oTestObject3 = oTestDispatcherReply3.value(true);
	if (oTestObject1) {
		aLOG << "oTestObject3->mTestString() =" << oTestObject3->mTestString();
	} else {
		aLOG << oTestObject3;
		aLOG << oTestDispatcherReply3;
	}

	return oApplication.exec();
}
