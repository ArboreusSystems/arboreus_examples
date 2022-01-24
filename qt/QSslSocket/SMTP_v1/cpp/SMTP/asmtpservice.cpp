// ----------------------------------------------------------
/*!
	\class ASMTPService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 20:40:41
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asmtpservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ASMTPService::ASMTPService(QObject* parent) : AThreadServiceTemplate(parent) {

	_A_DEBUG << "ASMTPService created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASMTPService::~ASMTPService(void) {

	_A_DEBUG << "ASMTPService deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slInit(void) {

	_A_DEBUG << "ASMTPService initiated";

	emit sgInitiated();
}

