// ----------------------------------------------------------
/*!
	\headerfile ANetwork
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 17:06:22
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORK_H
#define ANETWORK_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <athreadobjectcontrollertemplate.h>
#include <athreadtemplate.h>
#include <anetworkservice.h>
#include <anetworkagent.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ANetwork : public AThread<ANetworkService> {

	Q_OBJECT

	public:

		explicit ANetwork(QObject *parent = nullptr);
		virtual ~ANetwork(void);

	public slots:

		void mDownload(QString inURL);

		void slInit(void);
		void slInitialised(void);

	signals:

		void sgInitialised(void);
		void sgInitService(void);

	private:

		ABackend* pBackend = nullptr;

		void mInitService(void);
};

#endif // ANETWORK_H
