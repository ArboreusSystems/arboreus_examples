// ----------------------------------------------------------
/*!
	\class ADownloadManager
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 12:13:58
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adownloadmanager.h"


// -----------
/*!
	\fn

	Doc.
*/

ADownloadManager::ADownloadManager(QObject *parent) : QObject(parent) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		&pManager,&QNetworkAccessManager::finished,
		this,&ADownloadManager::slFinished
	);

	ALOG << "ADownloadManager created";

}


// -----------
/*!
	\fn

	Doc.
*/

ADownloadManager::~ADownloadManager(void) {

	ALOG << "ADownloadManager deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADownloadManager::mDownload(QString inURLString) {

	QUrl oURL(inURLString);
	QNetworkRequest oRequest(oURL);
	QNetworkReply* oReply = pManager.get(oRequest);

#if QT_CONFIG(ssl)

	QObject::connect(
		oReply,&QNetworkReply::sslErrors,
		this,&ADownloadManager::slSSLErrors
	);

#endif

	pCurrentDownloads.append(oReply);
}


// -----------
/*!
	\fn

	Doc.
*/

void ADownloadManager::slFinished(QNetworkReply* inReply) {

	QUrl oURL = inReply->url();

	if (inReply->error()) {
		ALOG << "Failed download of" << oURL.toEncoded().constData() << "with error" << qPrintable(inReply->errorString());
	} else {
		if (this->mIsHTTPRedirect(inReply)) {
			ALOG << "Request redirected";
		} else {
			QString oFileName = this->mFileName(oURL);
			if (this->mFileSave(oFileName,inReply)) {
				ALOG << "Downloaded file:" << oURL.toEncoded().constData();
				ALOG << "File saved into:" << qPrintable(oFileName);
			}
		}
	}

	pCurrentDownloads.removeAll(inReply);
	inReply->deleteLater();

	if (pCurrentDownloads.isEmpty()) {
		ALOG << "Download process finished";
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void ADownloadManager::slSSLErrors(const QList<QSslError>& inErrors) {

#if QT_CONFIG(ssl)

	for (const QSslError& error : inErrors) {
		ALOG << "SSL ErrorL" << qPrintable(error.errorString());
	}

#else

	Q_UNUSED(inErrors);

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADownloadManager::mIsHTTPRedirect(QNetworkReply* inReply) {

	int oStatusCode = inReply->attribute(
		QNetworkRequest::HttpStatusCodeAttribute
	).toInt();

	return
		oStatusCode == 301 ||
		oStatusCode == 302 ||
		oStatusCode == 303 ||
		oStatusCode == 305 ||
		oStatusCode == 307 ||
		oStatusCode == 308;
}


// -----------
/*!
	\fn

	Doc.
*/

QString ADownloadManager::mFileName(const QUrl& inURL) {

	QString oPath = inURL.path();
	QString oBaseName = QFileInfo(oPath).fileName();

	if (oBaseName.isEmpty()) {
		oBaseName = "download_" + QString::number(QDateTime::currentMSecsSinceEpoch());
	}

	if (QFile::exists(oBaseName)) {
		int i = 0;
		oBaseName += ".";
		while (QFile::exists(oBaseName + QString::number(i))) {
			++i;
		}
		oBaseName += QString::number(i);
	}

	return oBaseName;
}


// -----------
/*!
	\fn

	Doc.
*/

bool ADownloadManager::mFileSave(const QString& inFilename, QIODevice* inData) {

	QString oFilePath = pBackend->pProperties->mPathApplicationData() + "/"+ inFilename;

	QFile oFile(oFilePath);
	if (!oFile.open(QIODevice::WriteOnly)) {
		ALOG << "Failed to write downloaded file in" << oFilePath.toStdString().c_str();
		return false;
	}
	oFile.write(inData->readAll());
	oFile.close();

	return true;
}
