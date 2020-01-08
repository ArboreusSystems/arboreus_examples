#include "aqmlbackend.h"

AQMLBackend::AQMLBackend(QObject *parent) : QObject(parent) {

	aLOG << "AQMLBackend: created";
}

AQMLBackend::~AQMLBackend(void) {

	aLOG << "AQMLBackend: deleted";
}

QVariantMap AQMLBackend::mTestEnumValue(void) {

	QVariantMap oReply = {};
	oReply.insert("status",true);
	oReply.insert("datum",A_ENUM(value1));

	return oReply;
}

QVariantMap AQMLBackend::mTestEnumMap(void) {

	QVariantMap oDatum = {};
	oDatum.insert("value1",A_ENUM(value1));
	oDatum.insert("value2",A_ENUM(value2));
	oDatum.insert("value3",A_ENUM(value3));

	QVariantMap oReply = {};
	oReply.insert("status",true);
	oReply.insert("datum",oDatum);

	return oReply;
}

QVariantMap AQMLBackend::mTestEnumList(void) {

	QVariantList oDatum = {};
	oDatum.append(A_ENUM(value1));
	oDatum.append(A_ENUM(value2));
	oDatum.append(A_ENUM(value3));

	QVariantMap oReply = {};
	oReply.insert("status",true);
	oReply.insert("datum",oDatum);

	return oReply;
}
