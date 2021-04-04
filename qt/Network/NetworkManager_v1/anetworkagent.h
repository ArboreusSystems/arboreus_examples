// ----------------------------------------------------------
/*!
	\headerfile ANetworkAgent
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 10:22:41
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORKAGENT_H
#define ANETWORKAGENT_H

// System includes
#include <QObject>

// Application includes
#include <anetworkservice.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ANetworkAgent : public QObject {

	Q_OBJECT

	public:

		ANetworkService* pNetworkService = nullptr;
		QString pURL = "NoDefinedURLFroDownload";

		explicit ANetworkAgent(QObject* parent = nullptr);
		virtual ~ANetworkAgent(void);

	public slots:

		void slStartDownload(void);

	private:


};

#endif // ANETWORKAGENT_H
