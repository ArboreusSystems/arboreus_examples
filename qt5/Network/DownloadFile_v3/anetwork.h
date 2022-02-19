// ----------------------------------------------------------
/*!
	\headerfile ANetwork
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/04/2021 at 16:23:19
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORK_H
#define ANETWORK_H

// System includes
#include <QObject>
#include <QNetworkAccessManager>

// Application includes
#include <anetworkdatamodels.h>
#include <anetworkagent.h>

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

	public slots:

		bool mDownload(QString inURL);

	private:

		ABackend* pBackend = nullptr;
		QNetworkAccessManager* pNetworkManager = nullptr;
		QString pCacheFolder = "NoCacheFolder";
};

#endif // ANETWORK_H
