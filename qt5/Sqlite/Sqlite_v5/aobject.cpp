// ----------------------------------------------------------
/*!
	\class AObject
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 14:55:01
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject::AObject(QObject *parent) : AThread<AObjectService>(new AObjectService,parent) {

	QObject::connect(
		this,&AObject::sgInitService,
		this->mService(),&AObjectService::slInitService
	);

	ALOG << "AObject created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObject::~AObject(void) {

	ALOG << "AObject deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AObject::mInitService(void) {

	emit sgInitService();
}
