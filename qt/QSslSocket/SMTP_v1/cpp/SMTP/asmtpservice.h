// ----------------------------------------------------------
/*!
	\headerfile ASMTPService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 20:40:41
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASMTPSERVICE_H
#define ASMTPSERVICE_H

// System includes
#include <QObject>
#include <QSslSocket>
#include <QSslPreSharedKeyAuthenticator>
#include <QAuthenticator>

// Application includes
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>
#include <asmtpdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ASMTPService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ASMTPService(QObject* parent = nullptr);
		virtual ~ASMTPService(void);

	public slots:

		void slInit(void);

	signals:

		void sgInitiated(void);

	private:

		QSslSocket* pSslSocket = nullptr;

		void mInit(void);

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

#endif // ASMTPSERVICE_H