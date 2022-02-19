/* -------------------------------------------------------------------
 *  @doc QML Custom component
 *  @notice Template file classes/file.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 18:29:33
 * */// --------------------------------------------------------------

#include "qmlcustomcomponent.h"


QMLCustomComponent::QMLCustomComponent(QObject *parent)
: QObject(parent) {

	aLOG << "QMLCustomComponent::QMLCustomComponent created";

}

QMLCustomComponent::~QMLCustomComponent(){

	aLOG << "QMLCustomComponent::QMLCustomComponent deleted";
}

QString QMLCustomComponent::text(void) {

	pObjectiveCPP = new ObjectiveCPPProxyClass();

	aLOG << "QMLCustomComponent::text(void)";
	return pObjectiveCPP->mGetNSString();
}
