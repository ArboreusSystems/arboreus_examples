// ----------------------------------------------------------
/*!
	\class APOP3
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 09:14:36
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "apop3.h"


// -----------
/*!
	\fn

	Doc.
*/

APOP3::APOP3(APOP3Properties* inProperties, QObject* parent) : ASSLSocketTemplate(parent) {

	pProperties = inProperties;

	_A_DEBUG << "APOP3 created";
}


// -----------
/*!
	\fn

	Doc.
*/

APOP3::~APOP3(void) {

	_A_DEBUG << "APOP3 Deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void APOP3::mInit(void) {

	ASSLSocketTemplate::mInit();

	_A_DEBUG << "APOP3 Initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

void APOP3::mLogin(void) {

	string oUserString;
	oUserString.append("USER ");
	oUserString.append(pProperties->User);
	oUserString.append("\n");

	string oPasswordString;
	oPasswordString.append("PASS ");
	oPasswordString.append(pProperties->Password);
	oPasswordString.append("\n");

	string oQuitString;
	oQuitString.append("QUIT\n");

	pSslSocket->connectToHostEncrypted(pProperties->Server,pProperties->Port);

	pSslSocket->waitForReadyRead();
	pSslSocket->write(oUserString.c_str());
	pSslSocket->waitForReadyRead();
	pSslSocket->write(oPasswordString.c_str());
	pSslSocket->waitForReadyRead();
	pSslSocket->write(oQuitString.c_str());
	pSslSocket->waitForReadyRead();

	_A_DEBUG << "APOP3 Logged in";
}


