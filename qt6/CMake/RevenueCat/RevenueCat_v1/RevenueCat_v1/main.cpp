/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/10/2026 at 16:12:24
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <arevenuecat.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQuickStyle::setStyle("Basic");
	QQmlApplicationEngine oEngine;

#if defined(Q_OS_ANDROID)
	const char* oRevenueCatPurchases = "com/revenuecat/purchases/Purchases";
	if (QJniObject::isClassAvailable(oRevenueCatPurchases)) {
		_A_DEBUG << "SUCCESS: RevenueCat is loaded and available";
	} else {
		_A_DEBUG << "ERROR: RevenueCat NOT found";
	}
#endif

	ARevenueCat* oRevenueCat = new ARevenueCat(&oEngine);
	oEngine.rootContext()->setContextProperty("ARevenueCat",oRevenueCat);

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
