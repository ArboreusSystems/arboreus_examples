/* -------------------------------------------------------------------
 *  @doc QML Custom component
 *  @notice Template file classes/file.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 18:29:33
 * */// --------------------------------------------------------------

#include "qmlcustomcomponent.h"
#include "mynotification.h"


QMLCustomComponent::QMLCustomComponent(QObject *parent)
: QObject(parent) {

}

QMLCustomComponent::~QMLCustomComponent(){

}

QString QMLCustomComponent::text(void) {

	MyNotification::Display("aaa","bbbb");
	QString vString = QString::fromStdString(MyNotification::Text());
	return vString;
}
