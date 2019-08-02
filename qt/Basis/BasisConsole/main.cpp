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


	return Application.exec();
}
