// ----------------------------------------------------------
/*!
	\class ANetworkAgent
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 10:22:41
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "anetworkagent.h"


// -----------
/*!
	\fn

	Doc.
*/

ANetworkAgent::ANetworkAgent(
	QNetworkAccessManager* inManager,
	QString inFolderForReply,
	QObject* parent
) : QObject(parent) {

	pManager = inManager;
	pFolderForReply = inFolderForReply;

	QObject::connect(
		this,&ANetworkAgent::sgDownload,
		this,&ANetworkAgent::slDownload
	);

	ALOG << "ANetworkAgent created with properties";
}

// -----------
/*!
	\fn

	Doc.
*/

ANetworkAgent::ANetworkAgent(QObject *parent) : QObject(parent) {

	ALOG << "ANetworkAgent created with deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

ANetworkAgent::~ANetworkAgent(void) {

	ALOG << "ANetworkAgent deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetworkAgent::mDownload(QString inURL) {

	pProperties.URL = inURL;
	pProperties.Headers.insert("User-Agent","ArboreusTest");

	emit sgDownload();
}


// -----------
/*!
	\fn

	Doc.
*/

void ANetworkAgent::slDownload(void) {

	QNetworkRequest oRequest = this->mCreateRequest();

	QEventLoop oEventLoop;
	QNetworkReply* oReply = pManager->get(oRequest);
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
		emit sgFinished();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

QNetworkRequest ANetworkAgent::mCreateRequest(void) {

	QNetworkRequest oOutput;
	oOutput.setUrl(pProperties.URL);

	QMapIterator<QString,QString> oIterator(pProperties.Headers);
	while (oIterator.hasNext()) {
		oIterator.next();
		oOutput.setRawHeader(oIterator.key().toLocal8Bit(),oIterator.value().toLocal8Bit());
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QString ANetworkAgent::mFileName(const QUrl &inURL) {

	return QFileInfo(inURL.path()).fileName();
}


// -----------
/*!
	\fn

	Doc.
*/

bool ANetworkAgent::mFileSave(const QString& inFilename, QIODevice* inData) {

	QString oFileName = inFilename;
	QString oFilePath = pFolderForReply + "/"+ oFileName;
	if (QFile::exists(oFilePath)) {
		int i = 0;
		oFileName += ".";
		while (QFile::exists(oFileName + QString::number(i))) {
			++i;
		}
		oFileName += QString::number(i);
		oFilePath = pFolderForReply + "/"+ oFileName;
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
