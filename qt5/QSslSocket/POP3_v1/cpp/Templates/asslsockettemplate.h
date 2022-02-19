// ----------------------------------------------------------
/*!
	\headerfile ASSLSocketTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 09:21:17
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASSLSOCKETTEMPLATE_H
#define ASSLSOCKETTEMPLATE_H

// System includes
#include <QObject>
#include <QSslSocket>
#include <QSslPreSharedKeyAuthenticator>
#include <QAuthenticator>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ASSLSocketTemplate : public QObject {

	Q_OBJECT

	public:

		explicit ASSLSocketTemplate(QObject* parent = nullptr);
		virtual ~ASSLSocketTemplate(void);

		virtual void mInit(void);

	signals:

		void sgInitiated(void);

	protected:

		QSslSocket* pSslSocket = nullptr;

	private slots:

		void slAboutToClose(void);
		void slBitesWritten(quint64 inBytes);
		void slChannelBytesWritten(int inChannel,quint64 inBytes);
		void slChannelReadyRead(int inChannel);
		void slConnected(void);
		void slDestroyed(QObject* inPointer);
		void slDisconnected(void);
		void slEncrypted(void);
		void slEncryptedBytesWritten(qint64 inBytes);
		void slErrorOccurred(QAbstractSocket::SocketError inError);
		void slHostFound(void);
		void slModeChanged(QSslSocket::SslMode inNewMode);
		void slNewSessionTicketReceived(void);
		void slPeerVerifyError(const QSslError& inError);
		void slPreSharedKeyAuthenticationRequired(QSslPreSharedKeyAuthenticator* inAuthenticator);
		void slProxyAuthenticationRequired(const QNetworkProxy& inProxy,QAuthenticator* inAuthenticator);
		void slReadChannelFinished(void);
		void slReadyRead(void);
		void slStateChanged(QAbstractSocket::SocketState inState);
};

#endif // ASSLSOCKETTEMPLATE_H
