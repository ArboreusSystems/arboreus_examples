// ----------------------------------------------------------
/*!
	\class AGlobal
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2020 at 10:50:06
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
}


// -----------
/*!
	\fn

	Doc.
*/

AGlobal::~AGlobal(void) {

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
