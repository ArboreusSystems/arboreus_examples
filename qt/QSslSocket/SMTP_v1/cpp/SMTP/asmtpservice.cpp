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

ASMTPProperties ASMTPService::mGetProperties(void) {

	return this->pProperties;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slInit(void) {

	this->mInit();

	_A_DEBUG << "ASMTPService initiated";

	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slSetProperties(ASMTPProperties inProperties) {

	pProperties = inProperties;

	emit sgPropertiesUpdated();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slMessageSend(ASMTPMessage inMessage) {

	_A_DEBUG << "Sending message:" << inMessage.ID;

	pSslSocket->connectToHostEncrypted(pProperties.ServerName,pProperties.Port);

	QString oHELO = QString("HELO ") + pProperties.ServerName + "\n";
	this->mWrite(oHELO.toLatin1().data());

	QString oMAIL_FROM = QString("MAIL FROM: ") + inMessage.From + "\n";
	this->mWrite(oMAIL_FROM.toLatin1().data());

	QString oRCPT_TO = QString("RCPT TO: ") + inMessage.To + "\n";
	this->mWrite(oRCPT_TO.toLatin1().data());

	this->mWrite("DATA\n");

	QString oMessageBody = QString("") +
		"to: " + inMessage.To + "\n" +
		"from: " + inMessage.From + "\n" +
		"subject: " + inMessage.Subject + "\n" +
		"\n" +
		inMessage.Message + "\n" +
		".\n";
	this->mWrite(oMessageBody.toLatin1().data());

	this->mWrite("QUIT\n");

	_A_DEBUG << "Message sent:" << inMessage.ID;
	emit sgMessageSent(inMessage.ID);
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::mInit(void) {

	pSslSocket = new QSslSocket(this);
	pProperties = ASMTPProperties();

	QObject::connect(
		pSslSocket,&QSslSocket::aboutToClose,
		this,&ASMTPService::slAboutToClose
	);
	QObject::connect(
		pSslSocket,&QSslSocket::bytesWritten,
		this,&ASMTPService::slBitesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelBytesWritten,
		this,&ASMTPService::slChannelBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::channelReadyRead,
		this,&ASMTPService::slChannelReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::connected,
		this,&ASMTPService::slConnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::destroyed,
		this,&ASMTPService::slDestroyed
	);
	QObject::connect(
		pSslSocket,&QSslSocket::disconnected,
		this,&ASMTPService::slDisconnected
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encrypted,
		this,&ASMTPService::slEncrypted
	);
	QObject::connect(
		pSslSocket,&QSslSocket::encryptedBytesWritten,
		this,&ASMTPService::slEncryptedBytesWritten
	);
	QObject::connect(
		pSslSocket,&QSslSocket::errorOccurred,
		this,&ASMTPService::slErrorOccurred
	);
	QObject::connect(
		pSslSocket,&QSslSocket::hostFound,
		this,&ASMTPService::slHostFound
	);
	QObject::connect(
		pSslSocket,&QSslSocket::modeChanged,
		this,&ASMTPService::slModeChanged
	);
	QObject::connect(
		pSslSocket,&QSslSocket::newSessionTicketReceived,
		this,&ASMTPService::slNewSessionTicketReceived
	);
	QObject::connect(
		pSslSocket,&QSslSocket::peerVerifyError,
		this,&ASMTPService::slPeerVerifyError
	);
	QObject::connect(
		pSslSocket,&QSslSocket::preSharedKeyAuthenticationRequired,
		this,&ASMTPService::slPreSharedKeyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::proxyAuthenticationRequired,
		this,&ASMTPService::slProxyAuthenticationRequired
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readChannelFinished,
		this,&ASMTPService::slReadChannelFinished
	);
	QObject::connect(
		pSslSocket,&QSslSocket::readyRead,
		this,&ASMTPService::slReadyRead
	);
	QObject::connect(
		pSslSocket,&QSslSocket::stateChanged,
		this,&ASMTPService::slStateChanged
				);
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::mWrite(const char* inData) {

	_A_DEBUG << inData;
	pSslSocket->write(inData);
	_A_DEBUG << "Server:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slAboutToClose(void) {

	_A_DEBUG << "slAboutToClose";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slBitesWritten(quint64 inBytes) {

	_A_DEBUG << "slBitesWritten bytes:" << inBytes << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slChannelBytesWritten(int inChannel, quint64 inBytes) {

	_A_DEBUG << "slChannelBytesWritten channel:" << inChannel << "bytes:" << inBytes << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slChannelReadyRead(int inChannel) {

	_A_DEBUG << "slChannelReadyRead channel:" << inChannel << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slConnected(void) {

	_A_DEBUG << "slConnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slDestroyed(QObject* inPointer) {

	_A_DEBUG << "slDestroyed" << inPointer;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slDisconnected(void) {

	_A_DEBUG << "slDisconnected";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slEncrypted(void) {

	_A_DEBUG << "slEncrypted" << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slEncryptedBytesWritten(qint64 inBytes) {

	_A_DEBUG << "slEncryptedBytesWritten bytes:" << inBytes;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slErrorOccurred(QAbstractSocket::SocketError inError) {

	_A_DEBUG << "slErrorOccurred error:" << inError;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slHostFound(void) {

	_A_DEBUG << "slHostFound";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slModeChanged(QSslSocket::SslMode inNewMode) {

	_A_DEBUG << "slModeChanged new mode:" << inNewMode;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slNewSessionTicketReceived(void) {

	_A_DEBUG << "slNewSessionTicketReceived";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slPeerVerifyError(const QSslError &inError) {

	_A_DEBUG << "slPeerVerifyError" << inError.errorString();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slPreSharedKeyAuthenticationRequired(
	QSslPreSharedKeyAuthenticator *inAuthenticator
) {

	_A_DEBUG << "slPreSharedKeyAuthenticationRequired authenticator:" << inAuthenticator;
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slProxyAuthenticationRequired(
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

void ASMTPService::slReadChannelFinished(void) {

	_A_DEBUG << "slReadChannelFinished";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slReadyRead(void) {

	_A_DEBUG << "slReadyRead" << "data:" << pSslSocket->readAll().data();
}


// -----------
/*!
	\fn

	Doc.
*/

void ASMTPService::slStateChanged(QAbstractSocket::SocketState inState) {

	_A_DEBUG << "slStateChanged state:" << inState;
}

