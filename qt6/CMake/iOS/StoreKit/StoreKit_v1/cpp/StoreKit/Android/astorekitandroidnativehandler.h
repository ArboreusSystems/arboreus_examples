// ----------------------------------------------------------
/*!
	\headerfile AStoreKitAndroidNativeHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 12:27:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTOREKITANDROIDNATIVEHANDLER_H
#define ASTOREKITANDROIDNATIVEHANDLER_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes
#include <aloggerglobal.h>
#include <astorekitnativehandlerinterface.h>

// Constants and definitions

// Namespace

// Class definitions
class AStoreKitAndroidNativeHandler :
	public QObject,
	public AStoreKitNativeHandlerInterface {

	Q_OBJECT
	Q_INTERFACES(
		AStoreKitNativeHandlerInterface
	)

	public:

		explicit AStoreKitAndroidNativeHandler(QObject* parent = nullptr);
		virtual ~AStoreKitAndroidNativeHandler(void);


	// ----------------------------------
	// AStorekitConfigInterface

	public:

		void mGetProducts(void);
		void mBuyProduct(QString inID);
		void mRestoreProduct(QString inID);
};

#endif // ASTOREKITANDROIDNATIVEHANDLER_H
