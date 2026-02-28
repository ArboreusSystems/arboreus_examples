// ----------------------------------------------------------
/*!
	\class ADevice
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/02/2026 at 08:00:12
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adevice.h"


// -----------
/*!
	\fn

	Doc.
*/

ADevice::ADevice(QObject* parent) : QObject(parent) {

	pScreen = QGuiApplication::primaryScreen();
	QObject::connect(
		pScreen,&QScreen::orientationChanged,
		this,&ADevice::slOnOrientationChaged
	);

	_A_DEBUG << "ADevice created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADevice::~ADevice(void) {

	_A_DEBUG << "ADevice deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ADevice::slOnOrientationChaged(Qt::ScreenOrientation inOrientation) {

	switch (inOrientation) {
		case Qt::PortraitOrientation:
			_A_DEBUG << "ADevice -> Changed orientation: Portrait";
			break;
		case Qt::LandscapeOrientation:
			_A_DEBUG << "ADevice -> Changed orientation: Landscape";
			break;
		case Qt::InvertedLandscapeOrientation:
			_A_DEBUG << "ADevice -> Changed orientation: Inverted Landscape";
			break;
		case Qt::InvertedPortraitOrientation:
			_A_DEBUG << "ADevice -> Changed orientation: Inverted Portrait";
			break;
		default:
			_A_DEBUG << "ADevice -> Changed orientation: Undefined";
			break;
	}

	emit sgOrientationChanged(inOrientation);
}
