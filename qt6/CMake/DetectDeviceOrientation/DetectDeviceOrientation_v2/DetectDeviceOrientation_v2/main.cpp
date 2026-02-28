/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/02/2026 at 07:55:09
 * */// --------------------------------------------------------------

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <ADevice/adevice.h>

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	ADevice* oDevice = new ADevice(&oEngine);
    QQmlContext* oRootContext = oEngine.rootContext();
    oRootContext->setContextProperty("ADevice",oDevice);

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
