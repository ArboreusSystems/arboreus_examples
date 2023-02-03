// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/02/2023 at 12:19:27
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTOREKITNATIVEHANDLERINTERFACE_H
#define ASTOREKITNATIVEHANDLERINTERFACE_H

// System includes

// Application includes
#include <astorekitpch.h>

// Constants and defintions

// Namespace

class AStoreKitNativeHandlerInterface {

	public:

		virtual void mGetProducts(void) = 0;
		virtual void mBuyProduct(QString inID) = 0;
		virtual void mRestoreProduct(QString inID) = 0;
};

Q_DECLARE_INTERFACE( \
	AStoreKitNativeHandlerInterface, \
	"systems.arboreus.interfaces.AStoreKitNativeHandlerInterface" \
)

#endif // ASTOREKITNATIVEHANDLERINTERFACE_H
