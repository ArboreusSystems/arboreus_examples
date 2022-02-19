// ----------------------------------------------------------
/*!
	\class ATests
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/09/2020 at 11:04:34
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "atests.h"


// -----------
/*!
	\fn

	Doc.
*/

ATests::ATests(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ATests::~ATests(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void ATests::mRun(int inCounter, char *inArguments[]) {

	QTest::qExec(new ATestCase1,inCounter,inArguments);
	QTest::qExec(new ATestCase2,inCounter,inArguments);
}
