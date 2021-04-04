// ----------------------------------------------------------
/*!
	\headerfile ANetworkService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 17:06:42
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANETWORKSERVICE_H
#define ANETWORKSERVICE_H

// System includes
#include <QNetworkAccessManager>

// Application includes
#include <athreadservicetemplate.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ANetworkService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ANetworkService(QObject *parent = nullptr);
		virtual ~ANetworkService(void);

	public slots:

		void slInitService(void);

	signals:

		void sgInitialised(void);

	private:

		QNetworkAccessManager* pNetworkManager = nullptr;
};

#endif // ANETWORKSERVICE_H
