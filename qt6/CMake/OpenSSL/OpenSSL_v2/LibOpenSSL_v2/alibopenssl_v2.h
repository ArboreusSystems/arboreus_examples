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

#ifndef ALIBOPENSSL_V2_H
#define ALIBOPENSSL_V2_H

// Precompiled includes
#include <alibopenssl_v2_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>

// Namespace
using namespace std;


// Class definition
class ALibOpenSSL_v2 : public QObject {

	Q_OBJECT

	public:

		explicit ALibOpenSSL_v2(QObject* parent = nullptr);
		virtual ~ALibOpenSSL_v2(void);

		void mCreateRandom(unsigned char* inObject);
		vector<unsigned char> mEncrypt(
			const string& inString,
			const unsigned char* inKey,
			const unsigned char* inVector
		);
		string mDecrypt(
			const vector<unsigned char>& inEncryptedChars,
			const unsigned char* inKey,
			const unsigned char* inVector
		);
};

#endif // ALIBOPENSSL_V2_H
