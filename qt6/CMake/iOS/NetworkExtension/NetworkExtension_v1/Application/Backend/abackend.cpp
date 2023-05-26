// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief

	\list
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/05/2023 at 18:38:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "abackend.h"


// -----------
/*!
	\fn

	Doc.
*/

ABackend::ABackend(QObject* parent) : QObject{parent} {

	_A_DEBUG << "ABackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

ABackend::~ABackend(void){

	_A_DEBUG << "ABackend deleted";
}
