/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/09/2026 at 14:53:52
 * */// --------------------------------------------------------------

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <aprivacy.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter,inArguments);

	APrivacy* oPrivacy = APrivacy::mInstance();
	oPrivacy->mInit();

	QQmlApplicationEngine oEngine;

	oEngine.rootContext()->setContextProperty("APrivacy",oPrivacy);

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine,&QQmlApplicationEngine::objectCreationFailed,
		&oApplication,[]() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
