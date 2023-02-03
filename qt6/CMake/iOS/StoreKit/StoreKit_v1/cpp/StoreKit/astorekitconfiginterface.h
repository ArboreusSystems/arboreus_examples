// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 14:01:13
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTOREKITCONFIGINTERFACE_H
#define ASTOREKITCONFIGINTERFACE_H

// System includes

// Precompiled includes
#include <astorekitpch.h>

// Application includes

// Constants and defintions

// Namespace

class AStorekitConfigInterface {

	public:

		virtual void mStorekitConfigInterface_ProducIDs(QString inID) = 0;
};

Q_DECLARE_INTERFACE( \
	AStorekitConfigInterface, \
	"systems.arboreus.interfaces.AStorekitConfigInterface" \
)

#endif // ASTOREKITCONFIGINTERFACE_H
