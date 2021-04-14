// ----------------------------------------------------------
/*!
	\class ANetwork
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 14:06:12
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anetwork.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::ANetwork(QObject *parent) : QObject(parent) {

	ALOG << "ANetwork created";
}


// -----------
/*!
	\fn

	Doc.
*/

ANetwork::~ANetwork(void) {

	ALOG << "ANetwork deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mInit(void) {

	pBackend = &ABackend::mInstance();
	pNetworkManager = new QNetworkAccessManager(this);

	ALOG << "ANetwork initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetwork::mDownload(void) {

	QNetworkRequest oRequest;
	oRequest.setUrl(QUrl("write/url/here"));
	oRequest.setRawHeader("User-Agent", "MyOwnBrowser 1.0");

	QEventLoop oEventLoop;
	QNetworkReply* oReply = pNetworkManager->get(oRequest);
	QObject::connect(
		oReply,&QNetworkReply::finished,
		&oEventLoop,&QEventLoop::quit
	);
	oEventLoop.exec();

	ALOG << "URL:" << oReply->url().toEncoded().constData();
	if (oReply->error()) {
		ALOG << "Download failed with error:" << qPrintable(oReply->errorString());
	} else {
		QString oFileName = this->mFileName(oRequest.url());
		this->mFileSave(oFileName,oReply);
	}
}


// -----------
/*!
	\fn

	Doc.
*/

QString ANetwork::mFileName(const QUrl &inURL) {

	return QFileInfo(inURL.path()).fileName();
}


// -----------
/*!
	\fn

	Doc.
*/

bool ANetwork::mFileSave(const QString& inFilename, QIODevice* inData) {

	QString oFileName = inFilename;
	QString oFilePath = pBackend->pProperties->mPathApplicationData() + "/"+ oFileName;
	if (QFile::exists(oFilePath)) {
		int i = 0;
		oFileName += ".";
		while (QFile::exists(oFileName + QString::number(i))) {
			++i;
		}
		oFileName += QString::number(i);
		oFilePath = pBackend->pProperties->mPathApplicationData() + "/"+ oFileName;
	}

	QFile oFile(oFilePath);
	if (!oFile.open(QIODevice::WriteOnly)) {
		ALOG << "Failed to write downloaded file in" << oFilePath.toStdString().c_str();
		return false;
	}
	oFile.write(inData->readAll());
	oFile.close();

	ALOG << "File written" << oFilePath.toStdString().c_str();
	return true;
}
