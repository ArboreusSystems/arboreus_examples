// ----------------------------------------------------------
/*!
	\class AObject1
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:15:40
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobject1.h"


// -----------
/*!
	fn

	Doc.
*/

AObject1::AObject1(QObject *parent) : QObject(parent) {

	A_GLOBAL_INSTANCE;

	pDemoLoopLowest = new ALoop("AObject1 -> pThreadLowest",200);
	pDemoLoopLowest->moveToThread(pGlobal->pThreadLowest);
	pDemoLoopLowest->mRun();

	pDemoLoopNormal = new ALoop("AObject1 -> pThreadNormal",200);
	pDemoLoopNormal->moveToThread(pGlobal->pThreadNormal);
	pDemoLoopNormal->mRun();

	pDemoLoopLow = new ALoop("AObject1 -> pThreadLow",200);
	pDemoLoopLow->moveToThread(pGlobal->pThreadLow);
	pDemoLoopLow->mRun();
}


// -----------
/*!
	fn

	Doc.
*/

AObject1::~AObject1(void) {}

