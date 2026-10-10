/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 10/10/2026 at 22:22:37
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>


// Global functions
// -----------
/*!
	\fn

	Doc.
*/

QString getDeviceManufacturer() {

	QJniObject oManufacturer = QJniObject::getStaticObjectField(
		"android/os/Build",
		"MANUFACTURER",
		"Ljava/lang/String;"
	);

	return oManufacturer.toString();
}


// -----------
/*!
	\fn

	Doc.
*/

QString getDeviceBrand() {

	QJniObject oBrand = QJniObject::getStaticObjectField(
		"android/os/Build",
		"BRAND",
		"Ljava/lang/String;"
	);

	return oBrand.toString();
}


// Qt Quick Application
int main(int inCounter, char* inArguments[]) {

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;

	QString oManufacturer = getDeviceManufacturer().toLower();
	QString oBrand = getDeviceBrand().toLower();

	_A_DEBUG << "Manufacturer:" << oManufacturer;
	_A_DEBUG << "Brand:" << oBrand;

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
