// ----------------------------------------------------------
/*!
	\headerfile AIMAP
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/01/2022 at 14:40:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef AIMAP_H
#define AIMAP_H

// System includes
#include <QObject>
#include <QSslSocket>
#include <QString>
#include <QSslPreSharedKeyAuthenticator>
#include <QNetworkProxy>
#include <QAuthenticator>
#include <QAbstractSocket>
#include <QList>
#include <QSslError>

// Application includes
#include <aloggerglobal.h>
#include <aimapdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class AIMAP : public QObject {

	Q_OBJECT

	public:

		explicit AIMAP(QObject* parent = nullptr);
		virtual ~AIMAP(void);

		void mInit(AIMAPProperties* inProperties);
		void mLogin(void);
		void mWrite(const char* inData);

	signals:

		void sgInitiated(void);

	private:

		QSslSocket* pSslSocket = nullptr;
		AIMAPProperties* pProperties = nullptr;

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

#endif // AIMAP_H
