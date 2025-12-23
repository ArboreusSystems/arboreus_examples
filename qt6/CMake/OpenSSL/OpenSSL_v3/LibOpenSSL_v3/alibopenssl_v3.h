// ----------------------------------------------------------
/*!
	\headerfile ALibOpenSSL_v1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2025 at 22:52:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALIBOPENSSL_V3_H
#define ALIBOPENSSL_V3_H

// Precompiled includes
#include <alibopenssl_v3_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Class definition
class ALibOpenSSL_v3 : public QObject {

	Q_OBJECT

	public:

		explicit ALibOpenSSL_v3(QObject* parent = nullptr);
		virtual ~ALibOpenSSL_v3(void);

		QByteArray mEncryptString(
			const QString& inString,
			const QByteArray& inKey,
			const QByteArray& inVector
		);
		QString mDecryptString(
			const QByteArray& inBytes,
			const QByteArray& key,
			const QByteArray& iv
		);

	private:

		QByteArray mEncryptAES256CBC(
			const QByteArray& inBytes,
			const QByteArray& inKey,
			const QByteArray& inVector
		);
		QByteArray mDdecryptAES256CBC(
			const QByteArray& inBytes,
			const QByteArray& inKey,
			const QByteArray& inVector
		);
};

#endif // ALIBOPENSSL_V3_H
