// ----------------------------------------------------------
/*!
	\headerfile AStoreKitMacOSNativeHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 12:39:08
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKITMACOSNATIVEHANDLER_H
#define ASTOREKITMACOSNATIVEHANDLER_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes
#include <aloggerglobal.h>
#include <astorekitnativehandlerinterface.h>

// Constants and definitions

// Namespace

// Class definitions
class AStoreKitMacOSNativeHandler :
	public QObject,
	public AStoreKitNativeHandlerInterface {

	Q_OBJECT
	Q_INTERFACES(
		AStoreKitNativeHandlerInterface
	)

	public:

		explicit AStoreKitMacOSNativeHandler(QObject* parent = nullptr);
		virtual ~AStoreKitMacOSNativeHandler(void);


	// ----------------------------------
	// AStorekitConfigInterface

	public:

		void mGetProducts(void);
		void mBuyProduct(QString inID);
		void mRestoreProduct(QString inID);
};

#endif // ASTOREKITMACOSNATIVEHANDLER_H
