// ----------------------------------------------------------
/*!
	\class AObject2
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:16:04
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject2.h"


// -----------
/*!
	\fn

	Doc.
*/

AObject2::AObject2(QObject *parent) : QObject(parent) {

	A_GLOBAL_INSTANCE;

	pDemoLoopLowest = new ALoop("AObject2 -> pThreadLowest",200);
	pDemoLoopLowest->moveToThread(pGlobal->pThreadLowest);
	pDemoLoopLowest->mRun();

	pDemoLoopNormal = new ALoop("AObject2 -> pThreadNormal",200);
	pDemoLoopNormal->moveToThread(pGlobal->pThreadNormal);
	pDemoLoopNormal->mRun();

	pDemoLoopLow = new ALoop("AObject2 -> pThreadLow",200);
	pDemoLoopLow->moveToThread(pGlobal->pThreadLow);
	pDemoLoopLow->mRun();
}


// -----------
/*!
	\fn

	Doc.
*/

AObject2::~AObject2(void) {}

