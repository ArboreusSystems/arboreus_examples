// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 10:33:43
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECTONEINTERFACE_H
#define AOBJECTONEINTERFACE_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace

class AObjectOneInterface {

	public:

		virtual void mTestMethod(void) = 0;
};

Q_DECLARE_INTERFACE(AObjectOneInterface,"systems.arboreus.interfaces.AObjectOneInterface")


#endif // AOBJECTONEINTERFACE_H
