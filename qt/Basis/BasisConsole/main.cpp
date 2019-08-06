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
#include "signals/asignals.h"
#include "signals/aslots.h"
#include "containers/sequence/avector.h"
#include "containers/sequence/alist.h"
#include "handlers/ahandlermain.h"



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

	return Application.exec();
}
