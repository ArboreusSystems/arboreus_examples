// ----------------------------------------------------------
/*!
	\headerfile AStoreKitIOSNativeHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 12:35:24
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKITIOSNATIVEHANDLER_H
#define ASTOREKITIOSNATIVEHANDLER_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes
#include <aloggerglobal.h>
#include <astorekitnativehandlerinterface.h>
#include <astorekitnativeobjcglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AStoreKitIOSNativeHandler :
	public QObject,
	public AStoreKitNativeHandlerInterface {

	Q_OBJECT
	Q_INTERFACES(
		AStoreKitNativeHandlerInterface
	)

	public:

		explicit AStoreKitIOSNativeHandler(QObject* parent = nullptr);
		virtual ~AStoreKitIOSNativeHandler(void);


	// ----------------------------------
	// AStorekitConfigInterface

	public:

		void mGetProducts(void);
		void mBuyProduct(QString inID);
		void mRestoreProduct(QString inID);
};

#endif // ASTOREKITIOSNATIVEHANDLER_H
