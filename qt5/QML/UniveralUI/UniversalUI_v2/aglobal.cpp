// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 17:35:10
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aglobal.h"


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::AGlobal(QObject *parent) : QObject(parent) {

	pScreen = QGuiApplication::primaryScreen();
	pScreen->setOrientationUpdateMask(
		Qt::PortraitOrientation |
		Qt::LandscapeOrientation |
		Qt::InvertedPortraitOrientation |
		Qt::InvertedLandscapeOrientation
	);
	connect(
		pScreen,SIGNAL(orientationChanged(Qt::ScreenOrientation)),
		this,SLOT(mOrientationChanged(Qt::ScreenOrientation))
	);

	pDeviceType = ADevice::mType();

	ALOG_SYSTEM << "AGlobal created";
}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

	ALOG_SYSTEM << "AGlobal deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AGlobal::mOrientationChanged(Qt::ScreenOrientation inOrientation) {

	QString oOrientation;
	switch (inOrientation) {
		case Qt::ScreenOrientation::PortraitOrientation:
			oOrientation = "Portrait"; break;
		case Qt::ScreenOrientation::LandscapeOrientation:
			oOrientation = "Landscape"; break;
		case Qt::ScreenOrientation::InvertedLandscapeOrientation:
			oOrientation = "Landscape inverted"; break;
		case Qt::ScreenOrientation::InvertedPortraitOrientation:
			oOrientation = "Portrait inverted"; break;
		default: oOrientation = "Udefined"; break;
	}

	ALOG_SYSTEM << "Orientation changed: " + oOrientation;
	emit sgOrientationChanged(inOrientation);
}


// -----------
/*!
	\fn

	Doc.
*/

bool AGlobal::mIsLanscape(void) {

	return pScreen->isLandscape(pScreen->orientation());
}


// -----------
/*!
	\fn

	Doc.
*/

int AGlobal::mDeviceType(void) {

	return static_cast<int>(pDeviceType);
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap AGlobal::mDeviceSafeArea(void) {

	return ADeviceSafeArea::mToVariantMap(ADevice::mSafeArea());
}
