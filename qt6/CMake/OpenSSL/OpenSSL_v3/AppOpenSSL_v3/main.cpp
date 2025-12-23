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
#include <alibopenssl_v3.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	ALibOpenSSL_v3* oLibOpenSSL = new ALibOpenSSL_v3(&oEngine);

	QString oString = "String for encryption";
	QString oPassword = "SuperMegaMassword";
	QString oVector = "SomeUniqueVector";

	QByteArray oPassbytes = QCryptographicHash::hash(oPassword.toUtf8(),QCryptographicHash::Sha256);
	_A_DEBUG << "Encoded password:" << oPassbytes;

	QByteArray oVectorBytes = QCryptographicHash::hash(oVector.toUtf8(),QCryptographicHash::Md5).left(16);
	_A_DEBUG << "Encoded vector:" << oVectorBytes;

	QByteArray oEncryptedBytes = oLibOpenSSL->mEncryptString(oString,oPassbytes,oVectorBytes);
	_A_DEBUG << "Encrypted bytes:" << oEncryptedBytes;

	QString oDecryptedString = oLibOpenSSL->mDecryptString(oEncryptedBytes,oPassbytes,oVectorBytes);
	_A_DEBUG << "Decrypted string:" << oDecryptedString;

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
