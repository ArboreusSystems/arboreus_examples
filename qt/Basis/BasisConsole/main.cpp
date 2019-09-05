/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file console app/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 01/08/2019 at 14:55:14
 * */// --------------------------------------------------------------


// System includes
#include <QCoreApplication>
#include <QMetaProperty>
#include <QObject>

// Application includes
#include "Q_PROPERTY/aproperty.h"
#include "QVariant/avariant.h"
#include "signals/asignals.h"
#include "signals/aslots.h"
#include "containers/sequence/avector.h"
#include "containers/sequence/alist.h"
#include "containers/sequence/alinkedlist.h"
#include "containers/sequence/astack.h"
#include "containers/sequence/aqueue.h"
#include "containers/associative/amap.h"
#include "containers/associative/amultimap.h"
#include "containers/associative/ahash.h"
#include "containers/associative/amultihash.h"
#include "containers/associative/aset.h"
#include "handlers/ahandlermain.h"
#include "OOP/Singleton/oopsingletonecpp.h"
#include "OOP/Singleton/oopsingletoneqt.h"




int main(int Counter, char *Arguments[]) {

	QCoreApplication Application(Counter, Arguments);

	aProperty *oProperty = new aProperty();
	aLOG << "\n------------------\nTesting Q_PROPERTY\n------------------";
	aLOG << "Default values";
	aLOG << "RO String:" << oProperty->property("pStringRO").toString();
	aLOG << "RW String:" << oProperty->property("pStringRW").toString();
	oProperty->setProperty("pStringRO",QString("New Value for RO String"));
	oProperty->setProperty("pStringRW",QString("New Value for RW String"));
	aLOG << "Changed values";
	aLOG << "RO String:" << oProperty->property("pStringRO").toString();
	aLOG << "RW String:" << oProperty->property("pStringRW").toString();
	aLOG << "All properties";
	const QMetaObject *oMetaObject = oProperty->metaObject();
	for (int i = 0; i < oMetaObject->propertyCount(); i++) {
		QMetaProperty oMetaProperty = oMetaObject->property(i);
		aLOG << "Position:" << i << "Property name: " << oMetaProperty.name();
	}

	aLOG << "\n------------------\nTesting signals\n------------------";
	aSignals *oSignal = new aSignals();
	aSlots *oSlot = new aSlots();
	QObject::connect(oSignal,SIGNAL(mDoSignal(quint32,int)),oSlot,SLOT(mDoSlot(quint32,int)));
	oSignal->mDoTest();

	aLOG << "\n------------------\nObjects hierarchy\n------------------";
	QObject *oTreeRoot = new QObject();
	oTreeRoot->setObjectName("ROOT");
	QObject *oTreeNode1 = new QObject(oTreeRoot);
	oTreeNode1->setObjectName("Node 1");
	QObject *oTreeNode2 = new QObject(oTreeRoot);
	oTreeNode2->setObjectName("Node 2");
	QObject *oTreeNode3 = new QObject(oTreeRoot);
	oTreeNode3->setObjectName("Node 3");
	QObject *oTreeNode4 = new QObject(oTreeNode3);
	oTreeNode4->setObjectName("Node 4");
	QObject *oTreeNode5 = new QObject(oTreeNode3);
	oTreeNode5->setObjectName("Node 5");
	QObject *oTreeNode6 = new QObject(oTreeNode1);
	oTreeNode6->setObjectName("Node 6");
	oTreeRoot->dumpObjectTree();

	aLOG << "\n------------------\nContainers: QVector\n------------------";
	aVector *oVector = new aVector();
	oVector->mDoTest();

	aLOG << "\n------------------\nContainers: QList\n------------------";
	aList *oList = new aList();
	oList->mDoTest();

	aLOG << "\n------------------\nContainers: QLinkedList\n------------------";
	aLinkedList *oLinkedList = new aLinkedList();
	oLinkedList->mDoTest();

	aLOG << "\n------------------\nContainers: QStack\n------------------";
	aStack *oStack = new aStack();
	oStack->mDoTest();

	aLOG << "\n------------------\nContainers: QQueue\n------------------";
	aQueue *oQueue = new aQueue();
	oQueue->mDoTest();

	aLOG << "\n------------------\nContainers: QMap\n------------------";
	aMap *oMap = new aMap();
	oMap->mDoTest();

	aLOG << "\n------------------\nContainers: QMultiMap\n------------------";
	aMultiMap *oMultiMap = new aMultiMap();
	oMultiMap->mDoTest();

	aLOG << "\n------------------\nContainers: QHash\n------------------";
	aHash *oHash = new aHash();
	oHash->mDoTest();

	aLOG << "\n------------------\nContainers: QMultiHash\n------------------";
	aMultiHash *oMultiHash = new aMultiHash();
	oMultiHash->mDoTest();

	aLOG << "\n------------------\nContainers: QSet\n------------------";
	aSet *oSet = new aSet();
	oSet->mDoTest();

	aLOG << "\n------------------\nQVariant\n------------------";
	aVariant *oVariant = new aVariant();
	oVariant->mDoTest();

	aLOG << "\n------------------\nOOP: Singletone\n------------------";
	OOPSingletoneCPP &oSingletonCPP1 = OOPSingletoneCPP::Instance();
	aLOG << "oSingletonCPP1.pTestInt:" << oSingletonCPP1.pTestInt;
	oSingletonCPP1.pTestInt = 1;
	aLOG << "oSingletonCPP1.pTestInt:" << oSingletonCPP1.pTestInt;
	OOPSingletoneCPP &oSingletonCPP2 = OOPSingletoneCPP::Instance();
	aLOG << "oSingletonCPP2.pTestInt:" << oSingletonCPP2.pTestInt;
	OOPSingletoneQt &oSingletonQt1 = OOPSingletoneQt::Instance();
	aLOG << "oSingletonQt1.pTestString:" << oSingletonQt1.pTestString->toUtf8().constData();
	oSingletonQt1.pTestString = new QString("Changed value");
	aLOG << "oSingletonQt1.pTestString:" << oSingletonQt1.pTestString->toUtf8().constData();
	OOPSingletoneQt &oSingletonQt2 = OOPSingletoneQt::Instance();
	aLOG << "oSingletonQt2.pTestString:" << oSingletonQt2.pTestString->toUtf8().constData();

	return Application.exec();
}
