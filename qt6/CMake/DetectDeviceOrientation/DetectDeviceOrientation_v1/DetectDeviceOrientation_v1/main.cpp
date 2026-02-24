/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 24/02/2026 at 07:35:00
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
void fOnOrientationChange(Qt::ScreenOrientation inOrientation) {

	switch (inOrientation) {
		case Qt::PortraitOrientation:
			_A_DEBUG << "Changed orientation: Portrait";
			break;
		case Qt::LandscapeOrientation:
			_A_DEBUG << "Changed orientation: Landscape";
			break;
		case Qt::InvertedLandscapeOrientation:
			_A_DEBUG << "Changed orientation: Inverted Landscape";
			break;
		case Qt::InvertedPortraitOrientation:
			_A_DEBUG << "Changed orientation: Inverted Portrait";
			break;
		default:
			_A_DEBUG << "Changed orientation: Undefined";
			break;
	}
}


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	QScreen* oScreen = QGuiApplication::primaryScreen();
	if (oScreen) {
		QObject::connect(
			oScreen,&QScreen::orientationChanged,
			fOnOrientationChange
		);
		fOnOrientationChange(oScreen->orientation());
	}

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
