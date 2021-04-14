// ----------------------------------------------------------
/*!
	\headerfile ANetworkAgent
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 16:27:30
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORKAGENT_H
#define ANETWORKAGENT_H

// System includes
#include <QObject>
#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QEventLoop>
#include <QFile>
#include <QFileInfo>
#include <QMapIterator>

// Application includes
#include <anetworkdatamodels.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ANetworkAgent : public QObject {

	Q_OBJECT

	public:

		explicit ANetworkAgent(
			QNetworkAccessManager* inManager = nullptr,
			QString inFolderForReply = QString("NoDefinedFolderForReply"),
			QObject* parent = nullptr
		);
		explicit ANetworkAgent(QObject* parent = nullptr);
		virtual ~ANetworkAgent(void);

		void mDownload(QString inURL);

	signals:

		void sgDownload(void);

	private slots:

		void slDownload(void);

	private:

		ANetworkRequestProperties pProperties;
		QNetworkAccessManager* pManager = nullptr;
		QString pFolderForReply;

		QNetworkRequest mCreateRequest(void);
		QString mFileName(const QUrl& inURL);
		bool mFileSave(const QString& inFilename, QIODevice* inData);
};

#endif // ANETWORKAGENT_H
