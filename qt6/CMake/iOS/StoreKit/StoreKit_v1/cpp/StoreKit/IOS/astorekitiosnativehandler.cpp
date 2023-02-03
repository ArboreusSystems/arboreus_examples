// ----------------------------------------------------------
/*!
	\class AStoreKitIOSNativeHandler
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 12:35:24
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorekitiosnativehandler.h"


// -----------
/*!
	\fn

	Doc.
*/

AStoreKitIOSNativeHandler::AStoreKitIOSNativeHandler(QObject* parent) : QObject(parent) {

	fStoreKitNativeOBJC_Init();

	_A_DEBUG << "AStoreKitIOSNativeHandler created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStoreKitIOSNativeHandler::~AStoreKitIOSNativeHandler(void) {

	_A_DEBUG << "AStoreKitIOSNativeHandler deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKitIOSNativeHandler::mGetProducts(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKitIOSNativeHandler::mBuyProduct(QString inID) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AStoreKitIOSNativeHandler::mRestoreProduct(QString inID) {

}

