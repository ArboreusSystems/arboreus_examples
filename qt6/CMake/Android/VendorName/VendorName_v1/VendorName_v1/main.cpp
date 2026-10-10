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

// Global functions
// -----------
/*!
	\fn

	Doc.
*/

QString getDeviceManufacturer() {

	QJniObject manufacturer = QJniObject::getStaticObjectField(
		"android/os/Build",
		"MANUFACTURER",
		"Ljava/lang/String;"
	);

	return manufacturer.toString();
}


// -----------
/*!
	\fn

	Doc.
*/

QString getDeviceBrand() {

	QJniObject brand = QJniObject::getStaticObjectField(
		"android/os/Build",
		"BRAND",
		"Ljava/lang/String;"
	);

	return brand.toString();
}


// Qt Quick Application
int main(int inCounter, char* inArguments[]) {

	QGuiApplication oApplication(inCounter,inArguments);
	QQmlApplicationEngine oEngine;

	QString manufacturer = getDeviceManufacturer().toLower();
	QString brand = getDeviceBrand().toLower();

	qDebug() << "Manufacturer:" << manufacturer;
	qDebug() << "Brand:" << brand;

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
