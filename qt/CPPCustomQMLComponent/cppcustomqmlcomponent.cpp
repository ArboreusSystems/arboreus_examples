/* -------------------------------------------------------------------
 *  @doc The Custom QML Component Class
 *  @notice Template file classes/file.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/02/2019 at 10:36:11
 * */// --------------------------------------------------------------

#include "cppcustomqmlcomponent.h"


// Class constructor
CPPCustomQMLComponent::CPPCustomQMLComponent(QObject *parent)
: QObject(parent) {

	vConstantText = "Default Constant Text";
	vChangableText = "Default Changeble Text";
}


// Class destructor
CPPCustomQMLComponent::~CPPCustomQMLComponent(){}


// Getter: return Constant Text
QString CPPCustomQMLComponent::ConstantText() {

	return  vConstantText;
}


// Getter return: changable text
QString CPPCustomQMLComponent::ChangableText() {

	return vChangableText;
}


// Setter: define changable text
void CPPCustomQMLComponent::SetChagableText(QString String) {

	vChangableText = String;
}
