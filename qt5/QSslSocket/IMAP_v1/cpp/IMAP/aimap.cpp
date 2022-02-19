// ----------------------------------------------------------
/*!
	\class AIMAP
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/01/2022 at 14:40:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aimap.h"


// -----------
/*!
	\fn

	Doc.
*/

AIMAP::AIMAP(QObject* parent) : QObject(parent) {

	_A_DEBUG << "AIMAP created";
}


// -----------
/*!
	\fn

	Doc.
*/

AIMAP::~AIMAP(void) {

	_A_DEBUG << "AIMAP deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::mInit(AIMAPProperties* inProperties) {

	pProperties = inProperties;

	pSslSocket = new QSslSocket(this);
	pSslSocket->connectToHostEncrypted(pProperties->Server,pProperties->Port);
	_A_DEBUG << "1" << pSslSocket->readAll().data();

	QObject::connect(
		pSslSocket,&QSslSocket::aboutToClose,
		this,&AIMAP::slAboutToClose
	);
	QObject::connect(
		pSslSocket,&QSslSocket::bytesWritten,
		this,&AIMAP::slBitesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelBytesWritten,
		this,&AIMAP::slChannelBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelReadyRead,
		this,&AIMAP::slChannelReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::connected,
		this,&AIMAP::slConnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::destroyed,
		this,&AIMAP::slDestroyed
	);
	QObject::connect(
		pSslSocket,&QSslSocket::disconnected,
		this,&AIMAP::slDisconnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encrypted,
		this,&AIMAP::slEncrypted
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encryptedBytesWritten,
		this,&AIMAP::slEncryptedBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::errorOccurred,
		this,&AIMAP::slErrorOccurred
	);
	QObject::connect(
		pSslSocket,&QSslSocket::hostFound,
		this,&AIMAP::slHostFound
	);
	QObject::connect(
		pSslSocket,&QSslSocket::modeChanged,
		this,&AIMAP::slModeChanged
	);
	QObject::connect(
		pSslSocket,&QSslSocket::newSessionTicketReceived,
		this,&AIMAP::slNewSessionTicketReceived
	);
	QObject::connect(
		pSslSocket,&QSslSocket::peerVerifyError,
		this,&AIMAP::slPeerVerifyError
	);
	QObject::connect(
		pSslSocket,&QSslSocket::preSharedKeyAuthenticationRequired,
		this,&AIMAP::slPreSharedKeyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::proxyAuthenticationRequired,
		this,&AIMAP::slProxyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readChannelFinished,
		this,&AIMAP::slReadChannelFinished
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readyRead,
		this,&AIMAP::slReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::stateChanged,
		this,&AIMAP::slStateChanged
	);

	_A_DEBUG << "AIMAP initiated";

	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::mLogin(void) {

	_A_DEBUG << "IMAP Test started";

	QString oCommandLogin;
	oCommandLogin.append(pProperties->Tag);
	oCommandLogin.append(" ");
	oCommandLogin.append("LOGIN");
	oCommandLogin.append(" ");
	oCommandLogin.append(pProperties->User);
	oCommandLogin.append(" ");
	oCommandLogin.append(pProperties->Password);
	oCommandLogin.append("\r\n");

	this->mWrite(oCommandLogin.toLatin1().data());

	_A_DEBUG << "IMAP Test finished";
}

// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::mWrite(const char *inData) {

	_A_DEBUG << inData;
	pSslSocket->write(inData);
	_A_DEBUG << "Server:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slAboutToClose(void) {

	_A_DEBUG << "slAboutToClose";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slBitesWritten(quint64 inBytes) {

	_A_DEBUG << "slBitesWritten bytes:" << inBytes << "data:" << pSslSocket->readAll().data();;

}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slChannelBytesWritten(int inChannel, quint64 inBytes) {

	_A_DEBUG << "slChannelBytesWritten channel:" << inChannel << "bytes:" << inBytes << "data:" << pSslSocket->readAll().data();;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slChannelReadyRead(int inChannel) {

	_A_DEBUG << "slChannelReadyRead channel:" << inChannel << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slConnected(void) {

	_A_DEBUG << "slConnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slDestroyed(QObject* inPointer) {

	_A_DEBUG << "slDestroyed" << inPointer;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slDisconnected(void) {

	_A_DEBUG << "slDisconnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slEncrypted(void) {

	_A_DEBUG << "slEncrypted" << "data:" << pSslSocket->readAll().data();;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slEncryptedBytesWritten(qint64 inBytes) {

	_A_DEBUG << "slEncryptedBytesWritten bytes:" << inBytes;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slErrorOccurred(QAbstractSocket::SocketError inError) {

	_A_DEBUG << "slErrorOccurred error:" << inError;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slHostFound(void) {

	_A_DEBUG << "slHostFound";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slModeChanged(QSslSocket::SslMode inNewMode) {

	_A_DEBUG << "slModeChanged new mode:" << inNewMode;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slNewSessionTicketReceived(void) {

	_A_DEBUG << "slNewSessionTicketReceived";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slPeerVerifyError(const QSslError& inError) {

	_A_DEBUG << "slPeerVerifyError" << inError.errorString();
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slPreSharedKeyAuthenticationRequired(
	QSslPreSharedKeyAuthenticator* inAuthenticator
) {

	_A_DEBUG << "slPreSharedKeyAuthenticationRequired" << inAuthenticator;
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slProxyAuthenticationRequired(
	const QNetworkProxy& inProxy, QAuthenticator* inAuthenticator
) {

	Q_UNUSED(inProxy);
	Q_UNUSED(inAuthenticator);

	_A_DEBUG << "slProxyAuthenticationRequired";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slReadChannelFinished(void) {

	_A_DEBUG << "slReadChannelFinished";
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slReadyRead(void) {

	_A_DEBUG << "slReadyRead" << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void AIMAP::slStateChanged(QAbstractSocket::SocketState inState) {

	_A_DEBUG << "slStateChanged state:" << inState;
}


