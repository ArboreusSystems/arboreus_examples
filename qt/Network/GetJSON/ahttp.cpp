// ----------------------------------------------------------
/*!
	\class AHttp
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/12/2019 at 22:59:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "ahttp.h"


// -----------
/*!
	\fn

	Doc.
*/

AHttp::AHttp(QObject *parent) : QObject(parent) {

	pManager = new QNetworkAccessManager(this);

	QObject::connect(
		pManager,SIGNAL(finished(QNetworkReply*)),
		this,SLOT(mReply(QNetworkReply*))
	);

	A_MESSAGE_DEBUG << "AHttp: created";
}


// -----------
/*!
	\fn

	Doc.
*/

AHttp::~AHttp(void) {

	A_MESSAGE_DEBUG << "AHttp: deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AHttp::mGetJson(QString inURL) {

	QNetworkRequest oRequest = QNetworkRequest(QUrl(inURL));
	pManager->get(oRequest);
	A_MESSAGE_DEBUG << "Sending request: " << inURL;
}


// -----------
/*!
	\fn

	Doc.
*/

void AHttp::mReply(QNetworkReply* inReply) {

	A_MESSAGE_DEBUG << "Got reply:";

	if (inReply->error()) {
		A_MESSAGE_DEBUG << QString("Error %1").arg(inReply->errorString());
	} else {
		for (auto &i:inReply->rawHeaderPairs()) {
			qDebug() << QString().sprintf("%40s: %s",i.first.data(),i.second.data());
		}
		qDebug() << inReply->header(QNetworkRequest::ContentTypeHeader).toString();
		qDebug() << QJsonDocument::fromJson(inReply->readAll());
		inReply->deleteLater();
		pManager->deleteLater();
	}
}

