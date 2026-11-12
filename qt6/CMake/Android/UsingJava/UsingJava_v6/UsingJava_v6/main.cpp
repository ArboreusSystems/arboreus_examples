/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/11/2026 at 13:59:53
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <alibusingjava_v6.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	ALibUsingJava_v6* oLibJava = new ALibUsingJava_v6(&oEngine);
	_A_DEBUG << "oLibJava->mMessageWithString" << oLibJava->mMessageWithString("String from main");
	_A_DEBUG << "oLibJava->mMessage" << oLibJava->mMessage();

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
