// ----------------------------------------------------------
/*!
	\class ASSLSocketTemplate
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 09:21:17
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asslsockettemplate.h"


// -----------
/*!
	\fn

	Doc.
*/

ASSLSocketTemplate::ASSLSocketTemplate(QObject* parent) : QObject(parent) {

	_A_DEBUG << "ASSLSocketTemplate created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASSLSocketTemplate::~ASSLSocketTemplate(void) {

	_A_DEBUG << "ASSLSocketTemplate deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::mInit(void) {

	pSslSocket = new QSslSocket(this);

	QObject::connect(
		pSslSocket,&QSslSocket::aboutToClose,
		this,&ASSLSocketTemplate::slAboutToClose
	);
	QObject::connect(
		pSslSocket,&QSslSocket::bytesWritten,
		this,&ASSLSocketTemplate::slBitesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelBytesWritten,
		this,&ASSLSocketTemplate::slChannelBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelReadyRead,
		this,&ASSLSocketTemplate::slChannelReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::connected,
		this,&ASSLSocketTemplate::slConnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::destroyed,
		this,&ASSLSocketTemplate::slDestroyed
	);
	QObject::connect(
		pSslSocket,&QSslSocket::disconnected,
		this,&ASSLSocketTemplate::slDisconnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encrypted,
		this,&ASSLSocketTemplate::slEncrypted
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encryptedBytesWritten,
		this,&ASSLSocketTemplate::slEncryptedBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::errorOccurred,
		this,&ASSLSocketTemplate::slErrorOccurred
	);
	QObject::connect(
		pSslSocket,&QSslSocket::hostFound,
		this,&ASSLSocketTemplate::slHostFound
	);
	QObject::connect(
		pSslSocket,&QSslSocket::modeChanged,
		this,&ASSLSocketTemplate::slModeChanged
	);
	QObject::connect(
		pSslSocket,&QSslSocket::newSessionTicketReceived,
		this,&ASSLSocketTemplate::slNewSessionTicketReceived
	);
	QObject::connect(
		pSslSocket,&QSslSocket::peerVerifyError,
		this,&ASSLSocketTemplate::slPeerVerifyError
	);
	QObject::connect(
		pSslSocket,&QSslSocket::preSharedKeyAuthenticationRequired,
		this,&ASSLSocketTemplate::slPreSharedKeyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::proxyAuthenticationRequired,
		this,&ASSLSocketTemplate::slProxyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readChannelFinished,
		this,&ASSLSocketTemplate::slReadChannelFinished
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readyRead,
		this,&ASSLSocketTemplate::slReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::stateChanged,
		this,&ASSLSocketTemplate::slStateChanged
	);

	_A_DEBUG << "ASSLSocketTemplate initiated";

	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slAboutToClose(void) {

	_A_DEBUG << "slAboutToClose";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slBitesWritten(quint64 inBytes) {

	_A_DEBUG << "slBitesWritten bytes:" << inBytes << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slChannelBytesWritten(int inChannel, quint64 inBytes) {

	_A_DEBUG << "slChannelBytesWritten channel:" << inChannel << "bytes:" << inBytes << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slChannelReadyRead(int inChannel) {

	_A_DEBUG << "slChannelReadyRead channel:" << inChannel << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slConnected(void) {

	_A_DEBUG << "slConnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slDestroyed(QObject* inPointer) {

	_A_DEBUG << "slDestroyed" << inPointer;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slDisconnected(void) {

	_A_DEBUG << "slDisconnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slEncrypted(void) {

	_A_DEBUG << "slEncrypted" << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slEncryptedBytesWritten(qint64 inBytes) {

	_A_DEBUG << "slEncryptedBytesWritten bytes:" << inBytes;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slErrorOccurred(QAbstractSocket::SocketError inError) {

	_A_DEBUG << "slErrorOccurred error:" << inError;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slHostFound(void) {

	_A_DEBUG << "slHostFound";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slModeChanged(QSslSocket::SslMode inNewMode) {

	_A_DEBUG << "slModeChanged new mode:" << inNewMode;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slNewSessionTicketReceived(void) {

	_A_DEBUG << "slNewSessionTicketReceived";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slPeerVerifyError(const QSslError &inError) {

	_A_DEBUG << "slPeerVerifyError" << inError.errorString();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slPreSharedKeyAuthenticationRequired(
	QSslPreSharedKeyAuthenticator *inAuthenticator
) {

	_A_DEBUG << "slPreSharedKeyAuthenticationRequired authenticator:" << inAuthenticator;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slProxyAuthenticationRequired(
	const QNetworkProxy &inProxy, QAuthenticator *inAuthenticator
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

void ASSLSocketTemplate::slReadChannelFinished(void) {

	_A_DEBUG << "slReadChannelFinished";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slReadyRead(void) {

	_A_DEBUG << "slReadyRead" << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASSLSocketTemplate::slStateChanged(QAbstractSocket::SocketState inState) {

	_A_DEBUG << "slStateChanged state:" << inState;
}





