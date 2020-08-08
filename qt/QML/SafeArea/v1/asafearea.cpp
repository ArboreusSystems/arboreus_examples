// ----------------------------------------------------------
/*!
	\class ASafeArea
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 16:00:33
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asafearea.h"


// -----------
/*!
	\fn

	Doc.
*/

ASafeArea::ASafeArea(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ASafeArea::~ASafeArea(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaInsets* ASafeArea::mGetInsets(void) {

	ASafeAreaInsets* oOutput = new ASafeAreaInsets();

#ifdef Q_OS_IOS

	oOutput = ASafeAreaIOS::mGetInsets();

#elif defined(Q_OS_ANDROID)

#else

#endif

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ASafeArea::mInsets(void) {

	return mGetInsets()->mToVariantMap();
}
