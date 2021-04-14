// ----------------------------------------------------------
/*!
	\headerfile ANetwork
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 14:06:12
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORK_H
#define ANETWORK_H

// System includes
#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QEventLoop>

// Application includes

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ANetwork : public QObject {

	Q_OBJECT

	public:

		explicit ANetwork(QObject *parent = nullptr);
		virtual ~ANetwork(void);

		void mInit(void);
		void mDownload(void);

	private:

		ABackend* pBackend = nullptr;
		QNetworkAccessManager* pNetworkManager = nullptr;

		QString mFileName(const QUrl& inURL);
		bool mFileSave(const QString& inFilename, QIODevice* inData);
};

#endif // ANETWORK_H
