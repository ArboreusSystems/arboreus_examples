// ----------------------------------------------------------
/*!
	\headerfile AStoreKitService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 15:59:43
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKITSERVICE_H
#define ASTOREKITSERVICE_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes
#include <aloggerglobal.h>
#include <athreadservicetemplate.h>
#include <astorekitconfiginterface.h>
#include <astorekitnativehandlerinterface.h>
#include <astorekitdatamodels.h>

// iOS includes
#if defined(Q_OS_IOS)
#include <astorekitiosnativehandler.h>
#endif

// Android includes
#if defined(Q_OS_ANDROID)
#include <astorekitandroidnativehandler.h>
#endif

// MacOS includes
#if defined(Q_OS_MAC)
#include <astorekitmacosnativehandler.h>
#endif

// Constants and definitions

// Namespace

// Class definitions
class AStoreKitService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit AStoreKitService(QObject* parent = nullptr);
		virtual ~AStoreKitService(void);

	public slots:

		void slInit(AStorekitServiceProperties inProperties);

	signals:

		void sgInitiated(void);

	private:

		AStorekitConfigInterface* pConfig = nullptr;
		AStoreKitNativeHandlerInterface* pHandler = nullptr;
};

#endif // ASTOREKITSERVICE_H
