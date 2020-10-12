// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/10/2020 at 23:33:19
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::AGlobal(QObject *parent) : QObject(parent) {

	this->pLogger = &ALogger::mInstance();
	this->pUISkin = &AUISkin::mInstance();

	ALOG_SYSTEM << "AGlobal created";
}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

	ALOG_SYSTEM << "AGlobal deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mSetContext(QQmlContext *inRootContext) {

	inRootContext->setContextProperty("AGlobal",this);
	inRootContext->setContextProperty("ALogger",this->pLogger);
	inRootContext->setContextProperty("AUISkin",this->pUISkin);

	ALOG_SYSTEM << "AGlobal Defined context";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AGlobal::mDefaultString(void) {

	return QString(AGLOBAL_DEFAULT_STRING_LITERAL);
}

