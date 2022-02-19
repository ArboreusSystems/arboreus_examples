// ----------------------------------------------------------
/*!
	\headerfile ADownloadManager
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 12:13:58
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADOWNLOADMANAGER_H
#define ADOWNLOADMANAGER_H

// System includes
#include <QObject>
#include <QtNetwork>
#include <QVector>
#include <QList>
#include <QDateTime>
#include <QFile>
#include <QIODevice>

// Application includes
#include <abackend.h>

// Constants and definitions

// Namespace

// Class definitions
class ADownloadManager : public QObject {

	Q_OBJECT

	public:

		explicit ADownloadManager(QObject *parent = nullptr);
		virtual ~ADownloadManager(void);

		void mDownload(QString inURLString);

	private slots:

		void slFinished(QNetworkReply* inReply);
		void slSSLErrors(const QList<QSslError>& inErrors);

	private:

		ABackend* pBackend = nullptr;
		QNetworkAccessManager pManager;
		QVector<QNetworkReply*> pCurrentDownloads;

		bool mIsHTTPRedirect(QNetworkReply* inReply);
		QString mFileName(const QUrl& inURL);
		bool mFileSave(const QString& inFilename, QIODevice* inData);
};

#endif // ADOWNLOADMANAGER_H
