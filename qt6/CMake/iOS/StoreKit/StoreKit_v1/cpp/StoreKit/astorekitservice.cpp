// ----------------------------------------------------------
/*!
	\class AStoreKitService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 15:59:43
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorekitservice.h"


// -----------
/*!
	\fn

	Doc.
*/

AStoreKitService::AStoreKitService(QObject* parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "AStoreKitService created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStoreKitService::~AStoreKitService(void) {

	_A_DEBUG << "AStoreKitService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKitService::slInit(AStorekitServiceProperties inProperties) {

	pConfig = qobject_cast<AStorekitConfigInterface*>(inProperties.pConfig);

#if defined(Q_OS_IOS)
	pHandler = qobject_cast<AStoreKitNativeHandlerInterface*>(
		new AStoreKitIOSNativeHandler(this)
	);
#elif defined(Q_OS_ANDROID)
	pHandler = qobject_cast<AStoreKitNativeHandlerInterface*>(
		new AStoreKitAndroidNativeHandler(this)
	);
#else defined(Q_OS_MAC)
	pHandler = qobject_cast<AStoreKitNativeHandlerInterface*>(
		new AStoreKitMacOSNativeHandler(this)
	);
#endif

	_A_DEBUG << "AStoreKitService initiated";
	emit this->sgInitiated();
}

