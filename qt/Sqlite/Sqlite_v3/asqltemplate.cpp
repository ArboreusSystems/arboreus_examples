// ----------------------------------------------------------
/*!
	\class ASqlTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:00:40
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asqltemplate.h"


// -----------
/*!
	\fn

	Doc.
*/

ASqlTemplate::ASqlTemplate(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ASqlTemplate created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASqlTemplate::~ASqlTemplate(void) {

	ALOG_SYSTEM << "ASqlTemplate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASqlTemplate::slInit(ASqlDatabaseProperties* inProperties) {

	pProperties = inProperties;

	ALOG_SYSTEM << "ASqlTemplate initialised";
}
