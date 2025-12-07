// ----------------------------------------------------------
/*!
	\headerfile AOpenSSL
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/12/2025 at 07:54:55
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOPENSSL_H
#define AOPENSSL_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alibopenssl_v2.h>
#include <alogger.h>

// Namesapces
using namespace std;

// Constants and definitions

// Global functions
char fCastFromUnsigned(unsigned char inChar);

// Class definitions
class AOpenSSL : public QObject {

	Q_OBJECT

	public:

		explicit AOpenSSL(QObject* parent = nullptr);
		virtual ~AOpenSSL(void);

		QString mEncode(QString inString);
		QString mDecode(QString inString);

		void mSetPassword(QString inPassword);
		void mSetVector(QString inVector);

	private:

		ALibOpenSSL_v2* pLib = nullptr;
		const unsigned char* pPassword = nullptr;
		const unsigned char* pVector = nullptr;
};

#endif // AOPENSSL_H
