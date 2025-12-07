/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/09/2025 at 21:47:15
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// Libraries includes
#include <openssl/evp.h>
#include <openssl/rand.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <alibopenssl_v1.h>

// -----------
/*!
	\fn

	Doc.
*/

char fCastFromUnsigned(unsigned char inChar) {

	return static_cast<char>(inChar);
}


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	unsigned char oKey[55];
	unsigned char oVector[11];

	ALibOpenSSL_v1* oLibOpenSSL = new ALibOpenSSL_v1(&oEngine);
	oLibOpenSSL->mCreateRandom(oKey);
	oLibOpenSSL->mCreateRandom(oVector);

	string oString = "This is a string to be encrypted.";

	try {

		vector<unsigned char> ciphertext = oLibOpenSSL->mEncrypt(oString,oKey,oVector);
		string oEncryptedString;
		oEncryptedString.reserve(ciphertext.size());
		transform(ciphertext.begin(),ciphertext.end(),back_inserter(oEncryptedString),fCastFromUnsigned);

		_A_DEBUG << "Original string: " << oString;
		_A_DEBUG << "Encrypted string in BASE64: " << QString(oEncryptedString.c_str()).toUtf8().toBase64();
		_A_DEBUG << "Ciphertext string: " << ciphertext.size() << " bytes";

		string decryptedtext = oLibOpenSSL->mDecrypt(ciphertext,oKey,oVector);

		_A_DEBUG << "Decrypted string: " << decryptedtext;

	} catch (const std::runtime_error& catchError) {
		_A_DEBUG << "Error: " << catchError.what();
		return 1;
	}

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
