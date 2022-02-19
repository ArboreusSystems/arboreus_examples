// ----------------------------------------------------------
/*!
	\class ASession
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:31:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "acache.h"

// Namesapces
using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

ACache::ACache(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ASession created";
}


// -----------
/*!
	\fn

	Doc.
*/

ACache::~ACache(void) {

	_A_DEBUG << "ASession deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ACache::mPut(QString inKey, QVariant inValue) {

	pSession.insert(inKey,inValue);

	_A_DEBUG << pSession;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ACache::mGet(QString inKey) {

	ACacheReply oReply;

	QVariant oValue = pSession.value(inKey,"NoValue");
	if (oValue != "NoValue") {
		oReply.Status = true;
		oReply.Value = oValue;
	}

	return oReply.mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACache::mRemove(QString inKey) {

	pSession.remove(inKey);
}


// -----------
/*!
	\fn

	Doc.
*/

void ACache::mPutInCollection(QString inCollectionID, QString inKey, QVariant inValue) {

	QVariantMap oCollection;

	if (!this->mIsCollectionExisted(inCollectionID)) {
		oCollection.insert(inKey,inValue);
	} else {
		oCollection = qvariant_cast<QVariantMap>(pSession.value(inCollectionID));
		oCollection.insert(inKey,inValue);
	}

	pSession.insert(inCollectionID,oCollection);
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ACache::mGetFromCollection(QString inCollectionID, QString inKey) {

	ACacheReply oReply;
	QString oErrorValue = "ErrorValue";

	if (this->mIsCollectionExisted(inCollectionID)) {

		QVariantMap oCollection = qvariant_cast<QVariantMap>(pSession.value(inCollectionID));
		QVariant oValue = oCollection.value(inKey,oErrorValue);
		if(oValue != oErrorValue) {
			oReply.Status = true;
			oReply.Value = oValue;
		}
	}

	return oReply.mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACache::mRemoveFromCollection(QString inCollectionID, QString inKey) {

	if (this->mIsCollectionExisted(inCollectionID)) {
		QVariantMap oCollection = qvariant_cast<QVariantMap>(pSession.value(inCollectionID));
		oCollection.remove(inKey);
		pSession.insert(inCollectionID,oCollection);
	}
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ACache::mGetCollection(QString inCollectionID) {

	ACacheReply oReply;

	if (this->mIsCollectionExisted(inCollectionID)) {
		QVariantMap oCollection = qvariant_cast<QVariantMap>(pSession.value(inCollectionID));
		oReply.Status = true;
		oReply.Value = oCollection;
	}

	return oReply.mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

void ACache::mRemoveCollection(QString inCollectionID) {

	this->mRemove(inCollectionID);
}


// -----------
/*!
	\fn

	Doc.
*/

bool ACache::mIsCollectionExisted(QString inCollectionID) {

	QVariant oErrorValue = "NoCollection";

	QVariant oCollection = pSession.value(inCollectionID,oErrorValue);
	if (oErrorValue != oCollection) {
		if (strcmp(oCollection.typeName(),"QVariantMap") == 0) return true;
	}

	return false;
}

