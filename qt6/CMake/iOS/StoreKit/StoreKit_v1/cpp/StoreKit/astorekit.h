// ----------------------------------------------------------
/*!
	\headerfile AStoreKit
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 15:55:01
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKIT_H
#define ASTOREKIT_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes
#include <aloggerglobal.h>
#include <astorekitconfiginterface.h>
#include <athreadtemplate.h>
#include <astorekitservice.h>
#include <astorekitdatamodels.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AStoreKit : public AThreadTemplate<AStoreKitService> {

	Q_OBJECT

	public:

		explicit AStoreKit(QObject* parent = nullptr);
		virtual ~AStoreKit(void);

		void mInit(void);

	public slots:

		void slInitiated(void);

	signals:

		void sgInit(AStorekitServiceProperties inProperties);
		void sgInitiated(void);

	private:

		ABackend* pBackend = nullptr;
		AStorekitConfigInterface* pConfig = nullptr;
};

#endif // ASTOREKIT_H
