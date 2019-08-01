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

// Application includes
#include "aproperty.h"



int main(int Counter, char *Arguments[]) {

	QCoreApplication Application(Counter, Arguments);

	aProperty *oProperty = new aProperty();
	aLOG << "Testing Q_PROPERTY:\n------------------";
	aLOG << "Default values";
	aLOG << "RO String:" << oProperty->property("pStringRO").toString();
	aLOG << "RW String:" << oProperty->property("pStringRW").toString();
	oProperty->setProperty("pStringRO",QString("New Value for RO String"));
	oProperty->setProperty("pStringRW",QString("New Value for RW String"));
	aLOG << "Changed values";
	aLOG << "RO String:" << oProperty->property("pStringRO").toString();
	aLOG << "RW String:" << oProperty->property("pStringRW").toString();
	aLOG << "";



	return Application.exec();
}
