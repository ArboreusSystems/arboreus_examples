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
#include <aopenssl.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	AOpenSSL* oOpenSSL = new AOpenSSL(&oEngine);
	oOpenSSL->mSetPassword("$Super@Password");
	oOpenSSL->mSetVector("$Super@Vector");

	QString oString = "Test string for OpenSSL";
	_A_DEBUG << "Initial string:" << oString.toUtf8();

	QString oEncodedString = oOpenSSL->mEncode(oString);
	_A_DEBUG << "Encoded string:" << oEncodedString.toUtf8();

	QString oDecodedString = oOpenSSL->mDecode(oEncodedString);
	_A_DEBUG << "Decoded string:" << oDecodedString.toUtf8();

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
