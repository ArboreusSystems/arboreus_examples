// ----------------------------------------------------------
/*!
	\class AUITest
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/09/2020 at 20:35:23
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "auitest.h"


// -----------
/*!
	\fn

	Doc.
*/

AUITest::AUITest(QQmlApplicationEngine *inEngine, QObject *parent) : QObject(parent) {

	pEngine = inEngine;
}


// -----------
/*!
	\fn

	Doc.
*/

AUITest::AUITest(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AUITest::~AUITest(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void AUITest::mClick(int inX, int inY) {

	QPoint oPoint(inX,inY);

	auto oRootObjects = pEngine->rootObjects();
	for (auto& iObject : oRootObjects) {
		if (iObject->isWindowType()) {
			QWindow* iWindow = static_cast<QWindow*>(iObject);
			if (iWindow != nullptr) {
				QTest::mousePress(iWindow,Qt::LeftButton,Qt::NoModifier,oPoint,100);
				QTest::mouseClick(iWindow,Qt::LeftButton,Qt::NoModifier,oPoint,500);
			}
		}
	}

	ALOG_SYSTEM << "UIClick simulated with X:" << oPoint.rx() << "Y:" << oPoint.ry();
}


// -----------
/*!
	\fn

	Doc.
*/

void AUITest::mKeys(const QString& inText, int inDelay) {

	auto oRootObjects = pEngine->rootObjects();
	for (auto& iObject : oRootObjects) {
		if (iObject->isWindowType()) {
			QWindow* iWindow = static_cast<QWindow*>(iObject);
			if (iWindow != nullptr) {
				for (int i = 0; i < inText.length(); ++i) {
					QTest::qWait(inDelay);
					QTest::keyClick(iWindow,inText.at(i).toLatin1());
					ALOG_SYSTEM << "Clicked button:" << inText.at(i);
				}
			}
		}
	}
}
